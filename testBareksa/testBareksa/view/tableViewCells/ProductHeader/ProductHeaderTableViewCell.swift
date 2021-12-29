//
//  ProductHeaderTableViewCell.swift
//  testBareksa
//
//  Created by Jackie Leonardy on 29/12/21.
//

import UIKit
import SDWebImage

class ProductHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var stackHeaderView: UIStackView!
    @IBOutlet weak var leftProductImage: UIImageView!
    @IBOutlet weak var leftProductTitle: UILabel!
    @IBOutlet weak var centerProductImage: UIImageView!
    @IBOutlet weak var centerProductTitle: UILabel!
    @IBOutlet weak var rightProductImage: UIImageView!
    @IBOutlet weak var rightProductTitle: UILabel!
    
    private var headerDetailData: [[String: String]] = [[:]]
    
    //TODO: Create a reusable view to be implemented inside the stack view
//    var productHeaderList: [ProductHeaderView] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func getNib() -> UINib{
        return UINib(nibName: "\(ProductHeaderTableViewCell.self)", bundle: nil)
    }
    
    static func getIdentifier() -> String{
        return "ProductHeaderTableViewCell"
    }
    
    func setData(headerData: [[String: String]]) {
        leftProductImage.sd_setImage(with: URL(string: headerData[0]["productImageData"] ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        
        centerProductImage.sd_setImage(with: URL(string: headerData[1]["productImageData"] ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        
        rightProductImage.sd_setImage(with: URL(string: headerData[2]["productImageData"] ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        
        leftProductTitle.text = headerData[0]["productTitleData"]
        centerProductTitle.text = headerData[1]["productTitleData"]
        rightProductTitle.text = headerData[2]["productTitleData"]
    }
}
