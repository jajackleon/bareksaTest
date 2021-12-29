////
////  ProductStackHeader.swift
////  testBareksa
////
////  Created by Jackie Leonardy on 29/12/21.
////
//
//import UIKit
//
//class ProductStackHeader: UITableViewCell {
//    
//    private var productHeaderList: [ProductHeaderView] = []
//    
//    override class func awakeFromNib() {
//        super.awakeFromNib()
//    }
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.configHeaderStackView()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    static func getNib() -> UINib{
//        return UINib(nibName: "\(ProductStackHeader.self)", bundle: nil)
//    }
//    
//    static func getIdentifier() -> String{
//        return "ProductStackHeader"
//    }
//    
//    func setProductHeaderList(headerList: [ProductHeaderView]) {
//        self.productHeaderList = headerList
//    }
//    
//    func configHeaderStackView() {
//        let stack = UIStackView(arrangedSubviews: productHeaderList)
//        stack.axis = .horizontal
//        stack.alignment = .fill
//        stack.distribution = .fillEqually
//        stack.frame = self.bounds
//        addSubview(stack)
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        stack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
//        stack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
//    }
//    
//}
