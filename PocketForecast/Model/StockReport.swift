//
//  StockReport.swift
//  PocketForecast
//
//  Created by Maoning Guo on 2016-03-20.
//  Copyright © 2016 typhoon. All rights reserved.
//

import Foundation

public class StockReport : NSObject, NSCoding{
    private (set) var stockSymbol : String?
    private (set) var stockName : String?
    private (set) var stockView : UIView?
    private (set) var stockParameter : [String]?
    private (set) var stockData : [Double]?
    private (set) var stockDates : [String]?
    
    public init(stockSymbol : String, stockName : String, stockView : UIView!,
        stockParameter : [String], stockData : [Double], stockDates : [String]) {
        self.stockSymbol = stockSymbol;
        self.stockName = stockName;
        self.stockView = stockView;
        self.stockParameter = stockParameter;
            self.stockData = stockData;
            self.stockDates = stockDates;
    }
    
    public required init?(coder : NSCoder) {
        self.stockSymbol = coder.decodeObjectForKey("stockSymbol") as? String
        self.stockName = coder.decodeObjectForKey("stockName") as? String
        self.stockView = coder.decodeObjectForKey("stockView") as? UIView
        self.stockParameter = coder.decodeObjectForKey("stockParameter") as? [String]
        self.stockData = coder.decodeObjectForKey("stockData") as? [Double]
        self.stockDates = coder.decodeObjectForKey("stockDates") as? [String]
    }
    
    public func encodeWithCoder(coder : NSCoder) {
        
        coder.encodeObject(self.stockName!, forKey:"stockName")
        coder.encodeObject(self.stockSymbol!, forKey:"stockSymbol")
        if (stockView != nil) {
          coder.encodeObject(self.stockView!, forKey:"stockView")
        }
        coder.encodeObject(self.stockParameter!,forKey:"stockParameter")
        coder.encodeObject(self.stockData!, forKey:"stockData")
        coder.encodeObject(self.stockDates!,forKey:"stockDates")

    }
    
}
