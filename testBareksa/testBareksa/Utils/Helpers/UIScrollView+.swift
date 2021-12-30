//
//  UIScrollView+.swift
//  testBareksa
//
//  Created by Jackie Leonardy on 30/12/21.
//

import UIKit

public extension UIScrollView{
    func edgeTos(view: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
//    func edgeTos(view: UIView, navigation: UINavigationBar, tabBar: UITabBar){
//        translatesAutoresizingMaskIntoConstraints = false
//        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//    }
}
