//
//  HomeViewController.swift
//  Eternity
//
//  Created by A. Rodgers on 3/16/19.
//  Copyright © 2019 Yasin Ehsan. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var score: UILabel!
    var avg = Double(0)
    
    @IBAction func randomize(_ sender: UIButton) {
        //let count = Int(arc4random_uniform(20)+1)
        setChartValues(30)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setChartValues()
    }
    
    func setChartValues(_ count : Int = 30) {
        let values = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(UInt32(84)) + 168) //From 210 +/- 42
            avg = avg + val
            return ChartDataEntry(x: Double(i), y: val)
        }
        avg = avg/30
        avg.round(.down)
        
        score.text = String(avg);
        let set1 = LineChartDataSet(values: values, label: "Daily Carbon Footprint (lbs)")
        let data = LineChartData(dataSet: set1)
        
        self.lineChartView.data = data
        
    }
    
}
