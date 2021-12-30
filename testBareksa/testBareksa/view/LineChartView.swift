//
//  LineChartView.swift
//  testBareksa
//
//  Created by Jackie Leonardy on 30/12/21.
//

import Charts
import UIKit

class CustomLineChart: LineChartView {
    lazy var lineChart: LineChartView = {
        let lineChartView = LineChartView(frame: CGRect(x: 0, y: 0, width: 327, height: 186))
        lineChartView.backgroundColor = .clear
        lineChartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        lineChartView.legend.enabled = true
        lineChartView.rightAxis.enabled = false
        
        lineChartView.chartDescription?.enabled = false
        lineChartView.xAxis.drawGridLinesEnabled = false
        lineChartView.xAxis.drawLabelsEnabled = true
        lineChartView.xAxis.drawAxisLineEnabled = false
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.rightAxis.enabled = false
        lineChartView.drawBordersEnabled = false
        lineChartView.legend.form = .none
        lineChartView.xAxis.forceLabelsEnabled = true
        lineChartView.xAxis.granularityEnabled = true
        lineChartView.xAxis.granularity = 1
        return lineChartView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(lineChart)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setChart(dataEntries: [[ChartDataEntry]]) {
        lineChart.data = generateData(dataEntries: dataEntries)
    }
    
    private func generateLineChartDataSet(dataSetEntries: [ChartDataEntry], color: UIColor, fillColor: UIColor) -> LineChartDataSet{
        let dataSet = LineChartDataSet(values: dataSetEntries, label: "")
        dataSet.colors = [color]
        dataSet.mode = .cubicBezier
        dataSet.circleRadius = 4
        dataSet.circleHoleColor = fillColor
        dataSet.fill = Fill.fillWithColor(fillColor)
        dataSet.drawFilledEnabled = true
        dataSet.setCircleColor(UIColor.clear)
        dataSet.lineWidth = 2
        dataSet.valueTextColor = color
        dataSet.valueFont = UIFont(name: "Avenir", size: 12)!
        return dataSet
    }
    
    private func generateData(dataEntries: [[ChartDataEntry]]) -> LineChartData{
        if dataEntries.count == 3 {
            let data = LineChartData(dataSets: [
                generateLineChartDataSet(dataSetEntries: dataEntries[0], color: UIColor.blue, fillColor: UIColor.blueish),
                
                generateLineChartDataSet(dataSetEntries: dataEntries[1], color: UIColor.green, fillColor: UIColor.orange),

                generateLineChartDataSet(dataSetEntries: dataEntries[2], color: UIColor.orange, fillColor: UIColor.greenish)
            ])
            return data
        }
        return LineChartData()
    }
}
