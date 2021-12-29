//
//  ViewController.swift
//  testBareksa
//
//  Created by Jackie Leonardy on 28/12/21.
//

import UIKit
import RxCocoa

class ViewController: UIViewController {
    private let table = UITableView()
    private var codeSegmented: CustomSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHeader()
        setUpTable()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    private func set(){
        let timeFrameSegmented = CustomSegmentedControl(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 50), buttonTitle: ["1W","1M", "1Y", "3Y", "5Y", "10Y", "All"], segmentedType: .footerSegmented)

        timeFrameSegmented.backgroundColor = UIColor.clear
        timeFrameSegmented.delegate = self
        view.addSubview(timeFrameSegmented)
    }
    
    private func setUpHeader() {
        codeSegmented = CustomSegmentedControl(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 50), buttonTitle: ["Imbal Hasil","Dana Kelolaan"], segmentedType: .headerSegmented)
        codeSegmented.backgroundColor = UIColor.clear
        codeSegmented.delegate = self
        view.addSubview(codeSegmented)
    }

}

extension ViewController: CustomSegmentedControlDelegate {
    func change(to index: Int) {
        print(index)
    }
}

extension ViewController: UITableViewDelegate {
    
    private func setUpTable(){
        table.register(ProductHeaderTableViewCell.getNib(), forCellReuseIdentifier: ProductHeaderTableViewCell.getIdentifier())
        table.register(ProductDataTableViewCell.getNib(), forCellReuseIdentifier: ProductDataTableViewCell.getIdentifier())
        table.register(DetailButtonTableViewCell.getNib(), forCellReuseIdentifier: DetailButtonTableViewCell.getIdentifier())
        table.register(BuyButtonTableViewCell.getNib(), forCellReuseIdentifier: BuyButtonTableViewCell.getIdentifier())
        table.delegate = self
        table.dataSource = self
        table.allowsSelection = false
        table.isScrollEnabled = true
        table.separatorColor = UIColor.clear
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: codeSegmented.bottomAnchor, constant: 16).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        table.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        table.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 { return 150 }
        else if indexPath.section == 6 || indexPath.section == 7 { return 60 }
        else { return  100 }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductHeaderTableViewCell", for: indexPath) as! ProductHeaderTableViewCell
            cell.setData(headerData: [
            ["productImageData": "https://images.bareksa.com/im/avatar/bni_asset_management.png", "productTitleData": "BNI-AM Insipiring Equity Fund"],
            ["productImageData": "https://images.bareksa.com/im/avatar/bni_asset_management.png", "productTitleData": "1"],
            ["productImageData": "https://images.bareksa.com/im/avatar/bni_asset_management.png", "productTitleData": "2"],
            ])
            return cell
        }
        else if indexPath.section == 6 || indexPath.section == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailButtonTableViewCell", for: indexPath) as! DetailButtonTableViewCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDataTableViewCell", for: indexPath) as! ProductDataTableViewCell
        cell.setData(productData: ["abc", "def", "ghi"], productTitle: "Dana Kelolaan")
        return cell
    }
}
