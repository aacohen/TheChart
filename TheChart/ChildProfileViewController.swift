//
//  ChildProfileViewController.swift
//  TheChart
//
//  Created by Ariela Cohen on 3/20/17.
//  Copyright © 2017 Ariela Cohen. All rights reserved.
//

import UIKit
import Charts

class ChildProfileViewController: UIViewController {
    
    var header: UIView = UIView()
    var chart = BarChartView()
    var nameLabel = UILabel()
    var name = ""
    var image = UIImage()
    var age = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        chart.noDataText = "Add behaviour to the chart."
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        
        // Header View

        self.view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        header.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        header.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -75).isActive = true
        header.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        header.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        header.backgroundColor = UIColor.orange
        
        header.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: header.centerXAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: header.widthAnchor, multiplier: 0.35).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: header.heightAnchor, multiplier: 0.25).isActive = true
        nameLabel.text = name
        nameLabel.textColor = UIColor.black
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = UIColor.clear
        
        
        // Chart View
        self.view.addSubview(chart)
        chart.translatesAutoresizingMaskIntoConstraints = false
        chart.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        
        chart.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        chart.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        chart.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        chart.backgroundColor = UIColor.white

    }
    
}
