//
//  Data.swift
//  testBareksa
//
//  Created by Jackie Leonardy on 28/12/21.
//

import Foundation

struct ProductDetail: Codable {
    let code: Int
    let message, error: String
    let data: [Datum]
    let totalData: Int

    enum CodingKeys: String, CodingKey {
        case code, message, error, data
        case totalData = "total_data"
    }
}

// MARK: - Datum
struct Datum: Codable {
    let code, name: String
    let details: Details
}

// MARK: - Details
struct Details: Codable {
    let category: String
    let categoryID: Int
    let currency, custody, inceptionDate: String
    let imAvatar: String
    let imName: String
    let minBalance, minRedemption, minSubscription: Int
    let nav, returnCurYear, returnFiveYear, returnFourYear: Double
    let returnInceptionGrowth, returnOneDay, returnOneMonth, returnOneWeek: Double
    let returnOneYear, returnSixMonth, returnThreeMonth, returnThreeYear: Double
    let returnTwoYear: Double
    let totalUnit: Int
    let type: String
    let typeID: Int

    enum CodingKeys: String, CodingKey {
        case category
        case categoryID = "category_id"
        case currency, custody
        case inceptionDate = "inception_date"
        case imAvatar = "im_avatar"
        case imName = "im_name"
        case minBalance = "min_balance"
        case minRedemption = "min_redemption"
        case minSubscription = "min_subscription"
        case nav
        case returnCurYear = "return_cur_year"
        case returnFiveYear = "return_five_year"
        case returnFourYear = "return_four_year"
        case returnInceptionGrowth = "return_inception_growth"
        case returnOneDay = "return_one_day"
        case returnOneMonth = "return_one_month"
        case returnOneWeek = "return_one_week"
        case returnOneYear = "return_one_year"
        case returnSixMonth = "return_six_month"
        case returnThreeMonth = "return_three_month"
        case returnThreeYear = "return_three_year"
        case returnTwoYear = "return_two_year"
        case totalUnit = "total_unit"
        case type
        case typeID = "type_id"
    }
}
