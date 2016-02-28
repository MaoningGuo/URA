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

public class WeatherClientBasicImpl: NSObject, WeatherClient {

    var weatherReportDao: WeatherReportDao?
    var serviceUrl: NSURL?
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
            
            let newStr = String(data: data, encoding: NSUTF8StringEncoding);
            NSLog(newStr!);
            let strArr = newStr!.characters.split {$0 == ","}.map { String($0) }
            let stockName = strArr[0];
            let stockPrice1 = strArr[1];
            let stockPrice2 = strArr[2];
            
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
                NSLog(stockName);
                NSLog(stockPrice1);
                NSLog(stockPrice2);

            }
        }
    }
    
    public func loadStock(city: String!, onSuccess successBlock: ((Array<String>) -> Void)!, onError errorBlock: ((String!) -> Void)!) {
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            let url = self.queryURL(city)
            let data : NSData! = NSData(contentsOfURL: url)!
            
            let newStr = String(data: data, encoding: NSUTF8StringEncoding);
            NSLog(newStr!);
            var strArr = newStr!.characters.split {$0 == ","}.map { String($0) }
            
            let stockName = strArr[0];
            let stockPrice1 = strArr[1];
            let stockPrice2 = strArr[2];
            var myArr = [String](count: 4, repeatedValue:"")
            myArr[0] = stockName;
            myArr[1] = stockPrice1;
            myArr[2] = stockPrice2;
            myArr[3] = city;

            
            if stockName.characters.count == 0 {
                dispatch_async(dispatch_get_main_queue()) {
                    errorBlock("error");
                    return
                }
            } else {
                ////let weatherReport: WeatherReport = dictionary.toWeatherReport()
             //   self.weatherReportDao!.saveReport(weatherReport)
                dispatch_async(dispatch_get_main_queue()) {
                    successBlock(myArr)
                    return
                }
                NSLog(stockName);
                NSLog(stockPrice1);
                NSLog(stockPrice2);
                
            }
        }
    }


    private func queryURL(city: String) -> NSURL {

        let serviceUrl: NSURL = self.serviceUrl!
        let url: NSURL = serviceUrl.uq_URLByAppendingQueryDictionary([
          //  ?s=AAPL&f=nab
                "s": city,
                "format": "json",
                "f": "nab"
              //  "key": apiKey!
        ])

        return url
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