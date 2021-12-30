//
//  ProductDataTableViewCell.swift
//  testBareksa
//
//  Created by Jackie Leonardy on 29/12/21.
//

import UIKit

class ProductDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productDetailTitle: UILabel!
    
    @IBOutlet weak var leftProductDetailValue: UILabel!
    
    @IBOutlet weak var rightProductDetailValue: UILabel!
    
    @IBOutlet weak var centerProductDetailValue: UILabel!
    
    static func getNib() -> UINib{
        return UINib(nibName: "\(ProductDataTableViewCell.self)", bundle: nil)
    }
    
    static func getIdentifier() -> String{
        return "ProductDataTableViewCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(productData data: [String], productTitle title: String) {
        if !data.isEmpty {
            self.leftProductDetailValue.text = data[0]
            self.centerProductDetailValue.text = data[1]
            self.rightProductDetailValue.text = data[2]
            self.productDetailTitle.text = title
        }
    }
    
}
