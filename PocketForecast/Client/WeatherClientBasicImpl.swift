////////////////////////////////////////////////////////////////////////////////
//
//  TYPHOON FRAMEWORK
//  Copyright 2013, Typhoon Framework Contributors
//  All Rights Reserved.
//
//  NOTICE: The authors permit you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

import Foundation
import SwiftCSV
import Charts

public class WeatherClientBasicImpl: NSObject , WeatherClient{

    var weatherReportDao: WeatherReportDao?
    var serviceUrl: NSString?
    var daysToRetrieve: NSNumber?

    var apiKey: String? {
        willSet(newValue) {
            assert(newValue != "$$YOUR_API_KEY_HERE$$", "Please get an API key (v2) from: http://free.worldweatheronline.com, and then " +
                    "edit 'Configuration.plist'")
        }
    }

    public func loadWeatherReportFor(city: String!, onSuccess successBlock: ((WeatherReport!) -> Void)!, onError errorBlock: ((String!) -> Void)!) {


        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            let url = self.queryURLold(city)
            let data : NSData! = NSData(contentsOfURL: url)!
            let csvString = String(data: data, encoding: NSUTF8StringEncoding);
            
            let csv = CSV(string: csvString!);
            
            let closePrices = csv.columns["close"];
          //  NSLog((closePrices?.joinWithSeparator("\n"))!);
            
            
//            NSLog(newStr!);
//            let strArr = newStr!.characters.split {$0 == ","}.map { String($0) }
//            let stockName = strArr[0];
//            let stockPrice1 = strArr[1];
//            let stockPrice2 = strArr[2];
            
            let dictionary = (try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary

            if let error = dictionary.parseError() {
                dispatch_async(dispatch_get_main_queue()) {
                    errorBlock(error.rootCause())
                    return
                }
            } else {
                let weatherReport: WeatherReport = dictionary.toWeatherReport()
                self.weatherReportDao!.saveReport(weatherReport)
                dispatch_async(dispatch_get_main_queue()) {
                    successBlock(weatherReport)
                    return
                }
//                NSLog(stockName);
//                NSLog(stockPrice1);
//                NSLog(stockPrice2);

            }
        }
    }
    
    public func loadStock(city: String!, parameters : [String], onSuccess successBlock: ((WeatherReport?) -> Void)!, onError errorBlock: ((String!) -> Void)!) {

        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            let url = self.queryURL(city)
            let data : NSData! = NSData(contentsOfURL: url)!

            let csvString = String(data: data, encoding: NSUTF8StringEncoding);
         
            let csv = CSV(string: csvString!);
            
            let closePrices = csv.columns["Close"];
            let dates = csv.columns["Date"];
          //  NSLog((closePrices?.joinWithSeparator("\n"))!);
            
            let newStr = String(data: data, encoding: NSUTF8StringEncoding);
//            NSLog(newStr!);
            var strArr = newStr!.characters.split {$0 == ","}.map { String($0) }
            
            var prices = [Double]()
            
            for var index = 0; index < 365; ++index{
                let dd = Double(closePrices![index])!;
                prices.append(dd);
            }
            
            
            let stockName = strArr[0];
            let stockPrice1 = strArr[1];
            let stockPrice2 = strArr[2];
            var myArr = [String](count: 4, repeatedValue:"")
            myArr[0] = stockName;
            myArr[1] = stockPrice1;
            myArr[2] = stockPrice2;
            myArr[3] = city;
            
            var chartTestView : ChartViewController!
            chartTestView = ChartViewController(nibName: "chart", bundle: nil,prices: prices,dates : dates);
            var charView : UIView;
            charView = chartTestView.view;
            let stock = StockReport(stockSymbol: city,stockName: city, stockView: charView,stockParameter: parameters,stockData: prices,stockDates: dates!);
            let jsonData = TyphoonBundleResource.withName("SampleForecast.json", inBundle: NSBundle(forClass: self.classForCoder)).data
            
            let dictionary = (try! NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers))
                as! NSDictionary
    
            if stockName.characters.count == 0 {
                dispatch_async(dispatch_get_main_queue()) {
                    errorBlock("error");
                    return
                }
            } else {
                let weatherReport: WeatherReport = dictionary.toWeatherReport()
                weatherReport.setStockcustom(stock);// stock = stock;
                weatherReport.setCityName(city);
                
                self.weatherReportDao!.saveReport(weatherReport)
                dispatch_async(dispatch_get_main_queue()) {
                    successBlock(weatherReport)
                    return
                }
                NSLog(stockName);
                NSLog(stockPrice1);
                NSLog(stockPrice2);
                
            }
        }
    }


    private func queryURL(city: String) -> NSURL {

        let serviceUrl: NSString = self.serviceUrl!
        let fullServiceUrl: NSURL = NSURL(string: ((serviceUrl as String) + city + ".csv" + "?rows=365"))!;
//        let url: NSURL = serviceUrl.uq_URLByAppendingQueryDictionary([
//          //  ?s=AAPL&f=nab
//                "s": city,
//                "format": "json",
//                "f": "nab"
//              //  "key": apiKey!
//        ])

        return fullServiceUrl
    }
    
    private func queryURLold(city: String) -> NSURL {
        let serviceUrl: NSURL = NSURL(string: "http://api.worldweatheronline.com/free/v2/weather.ashx")!;
        let url: NSURL = serviceUrl.uq_URLByAppendingQueryDictionary([
            "q": city,
            "format": "json",
            "num_of_days": daysToRetrieve!.stringValue,
            "key": apiKey!
            ])
        
        return url    }


}