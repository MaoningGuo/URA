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
    
    @IBOutlet var label : UILabel?;
    
    var prices = [Double]()
    var dates = [String]()
   // var graphTitle = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        someStuff();

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!,
        prices : [Double]!, dates : [String]!) {
        self.prices = prices;
        self.dates = dates;
       // self.graphTitle = graphTitle;
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func someStuff() {
        var months: [String]!
        
        months = dates;
        var unitsSold = self.prices;
        unitsSold = unitsSold.reverse();
        
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
            
            
            let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Prices")
            lineChartDataSet.circleRadius = 0.07//2.0
            lineChartDataSet.setColor(UIColor.blueColor().colorWithAlphaComponent(0.5))
            let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
            lineChartView!.data = lineChartData
            lineChartView!.animate(xAxisDuration: 2.0, yAxisDuration: 2.0);
            lineChartView!.descriptionText = "365 Days"
            
            
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
