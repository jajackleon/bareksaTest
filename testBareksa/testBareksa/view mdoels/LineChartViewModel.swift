//
//  LineChartViewModel.swift
//  testBareksa
//
//  Created by Jackie Leonardy on 30/12/21.
//

import Charts

class LineChartViewModel {
    var productChartData: [[ChartDataEntry]] = [[ChartDataEntry]]()
    
    func fetchChartData(completion: @escaping ([[ChartDataEntry]]) -> Void ) {
        URLSession.shared.request(url: Constants.chartDataURL, expecting: ChartData.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let chartDatas):
                
                _ = chartDatas.data.values.map {
                    var emptyChart = [ChartDataEntry]()
                    _ = $0.data.map {
                        emptyChart.append(ChartDataEntry(x: Double($0.growth), y: Double($0.value)))
                    }
                    self.productChartData.append(emptyChart)
                    completion(self.productChartData)
                }

                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func generateLineChartDataSet(dataSetEntries: [ChartDataEntry], color: UIColor, fillColor: UIColor) -> LineChartDataSet{
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
    
    func generateData(dataEntries: [[ChartDataEntry]]) -> LineChartData{
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
