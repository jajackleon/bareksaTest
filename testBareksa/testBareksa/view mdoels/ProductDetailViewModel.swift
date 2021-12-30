//
//  ProductDetailViewModel.swift
//  testBareksa
//
//  Created by Jackie Leonardy on 29/12/21.
//

import Foundation
import UIKit
import Charts

class ProductDetailViewModel {
    var numberOfSection: Int = 0
    
    private var productDetail1W: [ProductDetailData] = [ProductDetailData]()
    private var productDetail1M: [ProductDetailData] = [ProductDetailData]()
    private var productDetail1Y: [ProductDetailData] = [ProductDetailData]()
    private var productDetail3Y: [ProductDetailData] = [ProductDetailData]()
    private var productDetail5Y: [ProductDetailData] = [ProductDetailData]()
    private var productDetail10Y: [ProductDetailData] = [ProductDetailData]()
    private var productDetailAll: [ProductDetailData] = [ProductDetailData]()
    
    var productHeader: [[String: String]] = [[String:String]]()
    
    var productData: [[ProductDetailData]] = [[ProductDetailData]]()
    
    var selectedProduct: [ProductDetailData] = [ProductDetailData]()
    
    var selectedIndex: Int = 0 {
        didSet {
            selectedProduct = productData[selectedIndex]
        }
    }
    
    func fetchData(tableView: UITableView) {
        URLSession.shared.request(url: Constants.productDetailURL, expecting: ProductDetail.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let productDetails):
                    for productDetail in productDetails.data {
                        self.productHeader.append([
                            "productImageData": productDetail.details.imAvatar,
                            "productTitleData": productDetail.name
                        ])
                        self.mapData(productDetail: productDetail)
                    }
                    self.productData.append(self.productDetail1W)
                    self.productData.append(self.productDetail1M)
                    self.productData.append(self.productDetail1Y)
                    self.productData.append(self.productDetail3Y)
                    self.productData.append(self.productDetail5Y)
                    self.productData.append(self.productDetail10Y)
                    self.productData.append(self.productDetailAll)
                
                    DispatchQueue.main.async {
                        self.numberOfSection = 8
                        self.selectedProduct = self.productDetail1W
                        tableView.reloadData()
                    }
                
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    private func mapData(productDetail: Datum) {
        let inception_date = productDetail.details.inceptionDate
        let min_subscription = Double(productDetail.details.minSubscription).formattedWithAbbreviations()
        let type = productDetail.details.type
        let tingkatResiko = "Sedang"
        let total_unit = productDetail.details.totalUnit
        let nav = productDetail.details.nav
                                
        self.productDetail1W.append(ProductDetailData(inception_date: inception_date, min_subscription:  min_subscription, type: type, tingkatResiko: tingkatResiko, total_unit: total_unit, nav: nav, return_money: productDetail.details.returnOneWeek, return_money_detail: productDetail.details.returnOneWeek.asPercentString().addPrefix(string: " / 1mgg")))
        
        self.productDetail1M.append(ProductDetailData(inception_date: inception_date, min_subscription:  min_subscription, type: type, tingkatResiko: tingkatResiko, total_unit: total_unit, nav: nav, return_money: productDetail.details.returnOneMonth, return_money_detail: productDetail.details.returnOneMonth.asPercentString().addPrefix(string: " / 1bln")))

        
        self.productDetail1Y.append(ProductDetailData(inception_date: inception_date, min_subscription:  min_subscription, type: type, tingkatResiko: tingkatResiko, total_unit: total_unit, nav: nav, return_money: productDetail.details.returnOneYear, return_money_detail: productDetail.details.returnOneYear.asPercentString().addPrefix(string: " / 1thn")))
        
        self.productDetail3Y.append(ProductDetailData(inception_date: inception_date, min_subscription:  min_subscription, type: type, tingkatResiko: tingkatResiko, total_unit: total_unit, nav: nav, return_money: productDetail.details.returnThreeYear, return_money_detail: productDetail.details.returnThreeYear.asPercentString().addPrefix(string: " / 3thn")))
        
        self.productDetail5Y.append(ProductDetailData(inception_date: inception_date, min_subscription:  min_subscription, type: type, tingkatResiko: tingkatResiko, total_unit: total_unit, nav: nav, return_money: productDetail.details.returnFiveYear, return_money_detail: productDetail.details.returnFiveYear.asPercentString().addPrefix(string: " / 5thn")))
        
        self.productDetail10Y.append(ProductDetailData(inception_date: inception_date, min_subscription:  min_subscription, type: type, tingkatResiko: tingkatResiko, total_unit: total_unit, nav: nav, return_money: productDetail.details.returnFiveYear, return_money_detail: productDetail.details.returnFiveYear.asPercentString().addPrefix(string: " / 10thn")))
        
        self.productDetailAll.append(ProductDetailData(inception_date: inception_date, min_subscription:  min_subscription, type: type, tingkatResiko: tingkatResiko, total_unit: total_unit, nav: nav, return_money: productDetail.details.returnInceptionGrowth, return_money_detail: productDetail.details.returnInceptionGrowth.asPercentString().addPrefix(string: " ATH")))
    }
}
