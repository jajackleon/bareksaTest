//
//  ViewController.swift
//  testBareksa
//
//  Created by Jackie Leonardy on 28/12/21.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    private var productVM : ProductDetailViewModel!
    private var lineChartVM: LineChartViewModel!
    private var lineChartView: CustomLineChart!
    
    //TODO: Wrap semua  view di dalam scroll view
    lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        
        let scrollViewHeight = UIScreen.main.bounds.height
        let scrollViewWidth = tabBarController?.view.frame.width ?? 0
        
        let scrollViewHeightFinal = scrollViewHeight
        
        scrollView.contentSize = CGSize(width: scrollViewWidth, height: scrollViewHeightFinal)
        
        scrollView.delegate = self
        
        return scrollView
    }()
    
    private let table = UITableView(frame: .zero, style: .grouped)
    
    private var codeSegmented: CustomSegmentedControl!
    private var timeFrameSegmented: TimeFrameHeader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productVM = ProductDetailViewModel()
        lineChartVM = LineChartViewModel()
        productVM.fetchData(tableView: table)
        setUpView()
        
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Your Title"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    private func setUpView() {
        setUpHeader()
        setUpLineChart()
        setUpTimeFrame()
        setUpTable()
    }
    
    private func setUpHeader() {
        codeSegmented = CustomSegmentedControl(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 50), buttonTitle: ["Imbal Hasil","Dana Kelolaan"], segmentedType: .headerSegmented)
        codeSegmented.backgroundColor = UIColor.clear
        codeSegmented.delegate = self
        view.addSubview(codeSegmented)
        codeSegmented.translatesAutoresizingMaskIntoConstraints = false
        codeSegmented.topAnchor.constraint(equalTo: view.topAnchor, constant: 42).isActive = true
        codeSegmented.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        codeSegmented.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        codeSegmented.heightAnchor.constraint(equalToConstant: 50).isActive =  true
    }
    
    private func setUpLineChart() {
        lineChartView = CustomLineChart(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: 300))
        view.addSubview(lineChartView)
        lineChartView.translatesAutoresizingMaskIntoConstraints = false
        lineChartView.topAnchor.constraint(equalTo: codeSegmented.bottomAnchor, constant: 8).isActive = true
        lineChartView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        lineChartView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        lineChartView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500).isActive = true
        lineChartVM.fetchChartData { Data in
            DispatchQueue.main.async {
                self.setChart(dataEntries: Data)
            }
        }
    }
    
    private func setUpTimeFrame() {
        timeFrameSegmented = TimeFrameHeader(frame: CGRect(x: 0, y: 30, width: self.view.frame.width, height: 20), buttonTitle: ["1W","1M", "1Y", "3Y", "5Y", "10Y", "All"], segmentedType: .headerSegmented)
        timeFrameSegmented.backgroundColor = UIColor.clear
        timeFrameSegmented.delegate = self
        timeFrameSegmented.backgroundColor = UIColor.clear
        view.addSubview(timeFrameSegmented)
        timeFrameSegmented.translatesAutoresizingMaskIntoConstraints = false
        timeFrameSegmented.heightAnchor.constraint(equalTo: codeSegmented.heightAnchor).isActive = true
        timeFrameSegmented.topAnchor.constraint(equalTo: lineChartView.bottomAnchor, constant: 8).isActive = true
        timeFrameSegmented.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        timeFrameSegmented.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
    }
}

extension ViewController: TimeFrameControlDelegate {
    func changeTime(to index: Int) {
        productVM.selectedIndex = index
        let sectionsIndexSet = IndexSet(1..<productVM.numberOfSection)
        table.reloadSections(sectionsIndexSet, with: .none)
    }
}

extension ViewController: CustomSegmentedControlDelegate {
    func change(to index: Int) {
        //MARK: Change view here
    }
}

extension ViewController: UITableViewDelegate {
    private func setUpTable(){
        registerCell()
        table.delegate = self
        table.dataSource = self
        table.allowsSelection = false
        table.isScrollEnabled = true
        table.separatorColor = UIColor.clear
        table.backgroundColor = UIColor.clear
        table.sectionHeaderHeight = 0
        table.sectionFooterHeight = 0
        view.addSubview(table)
        setTableConstraint()
    }
    
    private func registerCell() {
        table.register(ProductHeaderTableViewCell.getNib(), forCellReuseIdentifier: ProductHeaderTableViewCell.getIdentifier())
        table.register(ProductDataTableViewCell.getNib(), forCellReuseIdentifier: ProductDataTableViewCell.getIdentifier())
        table.register(DetailButtonTableViewCell.getNib(), forCellReuseIdentifier: DetailButtonTableViewCell.getIdentifier())
        table.register(BuyButtonTableViewCell.getNib(), forCellReuseIdentifier: BuyButtonTableViewCell.getIdentifier())
    }
    
    private func setTableConstraint() {
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: timeFrameSegmented.bottomAnchor, constant: 4).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        table.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        table.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 { return 150 }
        else if indexPath.section == 8 || indexPath.section == 9 { return 60 }
        else { return  100 }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        productVM.numberOfSection + 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductHeaderTableViewCell", for: indexPath) as! ProductHeaderTableViewCell
            cell.setData(headerData: productVM?.productHeader ?? [])
            return cell
        }
        else if indexPath.section == 8 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailButtonTableViewCell", for: indexPath) as! DetailButtonTableViewCell
            return cell
        }
        else if indexPath.section == 9 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BuyButtonTableViewCell", for: indexPath) as! BuyButtonTableViewCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDataTableViewCell", for: indexPath) as! ProductDataTableViewCell

        //MARK: -Bisa menggunakan dictionary yang dimap value sesuai indexPath, ini lebih memudahkan tanpa harus pakai if else
        
        if indexPath.section == 1 {
            cell.setData(productData: productVM.selectedProduct.map{
                $0.type
            }, productTitle: "Jenis Reksadana")
        }

        else if indexPath.section == 2 {
            cell.setData(productData: productVM.selectedProduct.map{
                $0.return_money_detail
            }, productTitle: "Imbal Hasil")
        }

        else if indexPath.section == 3 {
            cell.setData(productData: productVM.selectedProduct.map{
                $0.danaKelolaan
            }, productTitle: "Dana Kelolaan")
        }

        else if indexPath.section == 4 {
            cell.setData(productData: productVM.selectedProduct.map{
                $0.min_subscription
            }, productTitle: "Minimal Pembelian")
        }

        else if indexPath.section == 5 {
            cell.setData(productData: productVM.selectedProduct.map{
                $0.inception_date
            }, productTitle: "Jangka Waktu")
        }

        else if indexPath.section == 6 {
            cell.setData(productData: productVM.selectedProduct.map{
                $0.tingkatResiko
            }, productTitle: "Tingkat Resiko")
        }

        else if indexPath.section == 7 {
            cell.setData(productData: productVM.selectedProduct.map{
                $0.inception_date_formatted
            }, productTitle: "Peluncuran")
        }
        return cell
    }
}

extension ViewController {
    func setChart(dataEntries: [[ChartDataEntry]]) {
        lineChartView.lineChart.data = lineChartVM.generateData(dataEntries: dataEntries)
    }
}
