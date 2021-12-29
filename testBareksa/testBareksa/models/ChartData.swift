//
//  ChartData.swift
//  testBareksa
//
//  Created by Jackie Leonardy on 28/12/21.
//

import Foundation

// MARK: - Chart
struct ChartData: Codable {
    let code: Int
    let message, error: String
    let data: [String: DatumValue]
    let totalData: Int

    enum CodingKeys: String, CodingKey {
        case code, message, error, data
        case totalData = "total_data"
    }
}

// MARK: - DatumValue
struct DatumValue: Codable {
    let data: [DatumElement]
    let error: String
}

// MARK: - DatumElement
struct DatumElement: Codable {
    let date: String
    let value, growth: Double
}
