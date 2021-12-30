//
//  ProductDetailTimeFrame.swift
//  testBareksa
//
//  Created by Jackie Leonardy on 29/12/21.
//

import Foundation

public protocol ProductDetailTimeFrame {
    var inception_date: String { get }
    var min_subscription: String { get }
    var type: String { get }
    var tingkatResiko: String { get }
    var total_unit: Int { get }
    var nav: Double { get }
}

extension ProductDetailTimeFrame {
    var danaKelolaan: String {
        return (nav * Double(total_unit)).formattedWithAbbreviations()
    }
}

struct ProductDetailData: ProductDetailTimeFrame {
    var inception_date: String
    
    var min_subscription: String
    
    var type: String
    
    var tingkatResiko: String
    
    var total_unit: Int
    
    var nav: Double
    
    var return_money: Double
    
    var return_money_detail: String
    
    var inception_date_formatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateFromStr = dateFormatter.date(from: inception_date)
        dateFormatter.dateFormat = "dd MMM yyy"
        let timeFromDate = dateFormatter.string(from: dateFromStr ?? Date())
        return timeFromDate
    }
}




