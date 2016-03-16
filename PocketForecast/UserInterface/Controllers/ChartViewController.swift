//
//  LineChartViewController.swift
//  PocketForecast
//
//  Created by Maoning Guo on 2016-03-16.
//  Copyright © 2016 typhoon. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet var lineChartView: LineChartView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        someStuff();

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func someStuff() {
        var months: [String]!
        
        months = ["Feb 29", "Mar 1", "Mar 2", "Mar 4", "Mar 4", "Mar 7", "Mar 8", "Mar 9", "Mar 10", "Mar 11", "Mar 14", "Mar 15"]
        let unitsSold = [697.77	, 718.81, 718.85, 712.42, 710.89, 695.16, 693.97, 705.24, 712.82, 726.82, 730.49, 728.33]
        
        func setChart(dataPoints: [String], values: [Double]) {
            
            var dataEntries: [ChartDataEntry] = []
            
            for i in 0..<dataPoints.count {
                let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
                dataEntries.append(dataEntry)
            }
            
            //let pieChartDataSet = PieChartDataSet(yVals: dataEntries, label: "Units Sold")
            //let pieChartData = PieChartData(xVals: dataPoints, dataSet: pieChartDataSet)
            //  pieChartView.data = pieChartData
            
            var colors: [UIColor] = []
            
            for i in 0..<dataPoints.count {
                let red = Double(arc4random_uniform(256))
                let green = Double(arc4random_uniform(256))
                let blue = Double(arc4random_uniform(256))
                
                let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
                colors.append(color)
            }
            
            
            //  pieChartDataSet.colors = colors
            
            
            let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "GOOG")
          //  lineChartDataSet.colors = colors;
            let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
            lineChartView!.data = lineChartData
            
            
        }
        
        setChart(months, values: unitsSold);
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
