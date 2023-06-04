//
//  PorzzActivityViewController.swift
//  PorzZ
//
//  Created by Yuanlong Chen on 5/24/23.
//

import UIKit
import Charts

class PorzzActivityViewController: UIViewController {
    
    var pieChartView = PieChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        pieChartView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width)
        pieChartView.center = view.center
        view.addSubview(pieChartView)
        
        
        let totalPositionCount = Positions.shared.allPositions.count
        let triedPositionCount = Positions.shared.allPositions.filter{ $0.tried }.count + 5
        
        var pieChartDataEntries = [PieChartDataEntry]()
        
        pieChartDataEntries.append(PieChartDataEntry(value: Double(triedPositionCount), label: "Tried"))
        pieChartDataEntries.append(PieChartDataEntry(value: Double(totalPositionCount - triedPositionCount), label: "New"))
        
        let pieChartDataSet = PieChartDataSet(entries: pieChartDataEntries, label: "Positions")
        pieChartDataSet.colors = [Constants.Colors.darkBrown, .darkGray]
        
        let data = PieChartData(dataSet: pieChartDataSet)
        pieChartView.data = data
        
        pieChartView.legend.enabled = true
        pieChartView.legend.horizontalAlignment = .center
        pieChartView.legend.verticalAlignment = .bottom
        pieChartView.legend.orientation = .horizontal
        pieChartView.legend.drawInside = true
        pieChartView.legend.yOffset = -5
        pieChartView.legend.textColor = .brown
        
        pieChartView.notifyDataSetChanged()
    }
    
}
