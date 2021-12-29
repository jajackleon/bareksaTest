//
//  UIImageView+.swift
//  testBareksa
//
//  Created by Jackie Leonardy on 29/12/21.
//

import UIKit

@IBDesignable
class CircularImageView: UIImageView {
    override func layoutSubviews() {
        self.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
}
