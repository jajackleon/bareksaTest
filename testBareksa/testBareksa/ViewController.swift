//
//  ViewController.swift
//  testBareksa
//
//  Created by Jackie Leonardy on 28/12/21.
//

import UIKit
import RxCocoa

class ViewController: UIViewController {
    private let table = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let codeSegmented = CustomSegmentedControl(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 50), buttonTitle: ["Imbal Hasil","Dana Kelolan"], segmentedType: .headerSegmented)
        codeSegmented.backgroundColor = .clear
        codeSegmented.delegate = self
        view.addSubview(codeSegmented)
        
//        let timeFrameSegmented = CustomSegmentedControl(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 50), buttonTitle: ["1W","1M", "1Y", "3Y", "5Y", "10Y", "All"])
//        timeFrameSegmented.backgroundColor = .clear
//        timeFrameSegmented.delegate = self
//        view.addSubview(timeFrameSegmented)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
}

extension ViewController: CustomSegmentedControlDelegate {
    func change(to index: Int) {
        print(index)
    }
}

extension ViewController: UITableViewDelegate {
    private func setUpTable() {
        
        table.delegate = self
        table.dataSource = self
        table.allowsSelection = false
        table.isScrollEnabled = false
        table.backgroundColor = .white
        view.addSubview(table)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
