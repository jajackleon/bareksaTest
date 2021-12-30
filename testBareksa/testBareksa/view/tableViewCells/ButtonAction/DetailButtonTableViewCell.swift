//
//  DetailButtonTableViewCell.swift
//  testBareksa
//
//  Created by Jackie Leonardy on 29/12/21.
//

import UIKit

class DetailButtonTableViewCell: UITableViewCell {

    static func getNib() -> UINib{
        return UINib(nibName: "\(DetailButtonTableViewCell.self)", bundle: nil)
    }
    
    static func getIdentifier() -> String{
        return "DetailButtonTableViewCell"
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
