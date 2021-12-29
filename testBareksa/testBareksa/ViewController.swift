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
        codeSegmented = CustomSegmentedControl(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 50), buttonTitle: ["Imbal Hasil","Dana Kelolan"], segmentedType: .headerSegmented)
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
        print(view.frame.width)
        print(UIScreen.main.bounds.width)
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "ProfileCell")
//        table.register(ProfileHealthToggleTableViewCells.getNib(), forCellReuseIdentifier: ProfileHealthToggleTableViewCells.getIdentifier())
        table.delegate = self
        table.dataSource = self
        table.allowsSelection = false
        table.isScrollEnabled = false
        table.backgroundColor = .orange
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: codeSegmented.bottomAnchor, constant: 16).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        table.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        table.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
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
