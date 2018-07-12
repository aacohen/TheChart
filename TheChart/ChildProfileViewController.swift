//
//  ChildProfileViewController.swift
//  TheChart
//
//  Created by Ariela Cohen on 3/20/17.
//  Copyright © 2017 Ariela Cohen. All rights reserved.
//

import UIKit
import Charts

class ChildProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let sharedChildModel = CoreDataModel.shared
    
    var child = Child()
    
    var header: UIView = UIView()
    var chart = HorizontalBarChartView()
    var nameLabel = UILabel()
    var imageView = UIImageView()

    var addBehaviour = UIButton()
    
    let numberOfStarsNeeded = [7.0, 6.0, 10.0]
    let numberOfCurrentStars = [2.0, 3.0, 5.0]
    
    let reuseIdentifier = "chartCell"
    var tableView: UITableView  =   UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChartViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.view.addSubview(self.tableView)
        setupView()
//        sharedChildModel.fetch()
        sharedChildModel.fetchChore(child1: child)
        tableView.reloadData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        sharedChildModel.fetchChore(child1: child)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sharedChildModel.chores.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "chartCell", for: indexPath)
            as! ChartViewCell
    
        cell.choreName.text = sharedChildModel.chores[indexPath.row].name
        cell.rewardLabel.text = sharedChildModel.chores[indexPath.row].rewardName
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.height * 0.15
    }
    
    func addBehaviourButtonPressed() {
        let destVC = AddBehaviourViewController()
        destVC.child = child
        navigationController?.pushViewController(destVC, animated: true)
        
//        let destVC = AddBehaviourViewController()
//       
//        navigationController?.pushViewController(destVC, animated: true)
    }
    
    func setupView() {
        
        // Header View

        self.view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        header.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        header.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
        header.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        header.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        header.backgroundColor = UIColor.orange
        
        header.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: header.centerXAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: header.widthAnchor, multiplier: 0.35).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: header.heightAnchor, multiplier: 0.25).isActive = true
        nameLabel.text = child.name
        nameLabel.textColor = UIColor.black
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = UIColor.clear
        
        header.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: header.topAnchor, constant: 5).isActive = true
        imageView.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -5).isActive = true
        imageView.widthAnchor.constraint(equalTo: header.widthAnchor, multiplier: 0.15).isActive = true
        imageView.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 50.0).isActive = true
        imageView.backgroundColor = UIColor.red
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 2
        imageView.clipsToBounds = true
        imageView.image = UIImage(data: child.image! as Data)
        
        header.addSubview(addBehaviour)
        addBehaviour.addTarget(self, action: #selector(addBehaviourButtonPressed), for: .touchUpInside)
        addBehaviour.translatesAutoresizingMaskIntoConstraints = false
        addBehaviour.heightAnchor.constraint(equalTo: header.heightAnchor, multiplier: 0.25).isActive = true
        addBehaviour.widthAnchor.constraint(equalTo: addBehaviour.heightAnchor).isActive = true
        addBehaviour.leadingAnchor.constraint(equalTo: header.trailingAnchor, constant: -70.0).isActive = true
        addBehaviour.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -5.0).isActive = true
        addBehaviour.backgroundColor = UIColor.clear
        addBehaviour.setTitle("+", for: .normal)
        
//        // Chart View
//        self.view.addSubview(chart)
//        chart.translatesAutoresizingMaskIntoConstraints = false
//        chart.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
//
//        chart.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
//        chart.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//        chart.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//        chart.backgroundColor = UIColor.white
//
//        chart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
//
//        setChart(dataPoints: chores, values: numberOfCurrentStars)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
//    func setChart(dataPoints: [String], values: [Double]) {
//        chart.noDataText = "Add behaviour to the chart."
//
//        var dataEntries: [BarChartDataEntry] = []
//
//        for i in 0..<dataPoints.count {
////            let dataEntry = BarChartDataEntry(x: Double(values[i]) , y: Double(i))
//            let dataEntry = BarChartDataEntry(x: Double(i) , y: Double(values[i]))
//            dataEntries.append(dataEntry)
//        }
//
//        let chartDataSet = BarChartDataSet(values: dataEntries, label: "")
//        let chartData = BarChartData()
//        chartData.addDataSet(chartDataSet)
//
//        chartData.setDrawValues(false)
//        chartDataSet.colors = ChartColorTemplates.joyful()
//        chart.data = chartData
//        chart.leftAxis.labelPosition = .outsideChart
//
//        chart.xAxis.drawGridLinesEnabled = false
//        chart.leftAxis.drawGridLinesEnabled = false
//        chart.xAxis.labelPosition = .bottom
//        chart.xAxis.valueFormatter = IndexAxisValueFormatter(values: chores)
//        chart.legend.enabled = false
//
//        chart.xAxis.granularityEnabled = true
//        chart.xAxis.granularity = 1
//
//        let formatter: Formatter = Formatter()
//
//    }
    
}
