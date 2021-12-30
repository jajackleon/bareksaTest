//
//  BuyButtonTableViewCell.swift
//  testBareksa
//
//  Created by Jackie Leonardy on 30/12/21.
//

import UIKit

class BuyButtonTableViewCell: UITableViewCell {

    static func getNib() -> UINib{
        return UINib(nibName: "\(BuyButtonTableViewCell.self)", bundle: nil)
    }
    
    static func getIdentifier() -> String{
        return "BuyButtonTableViewCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
