//
//  AddBehaviourViewController.swift
//  TheChart
//
//  Created by Ariela Cohen on 10/26/17.
//  Copyright © 2017 Ariela Cohen. All rights reserved.
//

import UIKit

class AddBehaviourViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cancelButton = UIButton()
    var submitButton = UIButton()
//    var scrollView = UIScrollView()
    var tableView: UITableView  =   UITableView()
    var footerView: UITableViewHeaderFooterView = UITableViewHeaderFooterView()
    
    let reuseIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.grouped)
        tableView.delegate      =   self
        tableView.dataSource    =   self
        setupView()
        tableView.register(AddBehaviourTableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            as! AddBehaviourTableViewCell
        
        return cell
    }
    
    
    
    func setupView() {
        
        self.view.backgroundColor = UIColor.clear
        self.view.alpha = 1.0
        
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.frame
        self.view.insertSubview(blurEffectView, at: 0)
        
        
        footerView = UITableViewHeaderFooterView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        
        tableView.tableFooterView = footerView
        tableView.backgroundColor = UIColor.clear

        footerView.addSubview(submitButton)
        submitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.leadingAnchor.constraint(equalTo: footerView.leadingAnchor).isActive = true
        submitButton.topAnchor.constraint(equalTo: footerView.topAnchor).isActive = true
        submitButton.bottomAnchor.constraint(equalTo: footerView.bottomAnchor).isActive = true
        submitButton.trailingAnchor.constraint(equalTo:footerView.centerXAnchor).isActive = true
        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = UIColor.orange
        
        footerView.addSubview(cancelButton)
        cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.leadingAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        cancelButton.topAnchor.constraint(equalTo: footerView.topAnchor).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: footerView.bottomAnchor).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo:footerView.trailingAnchor).isActive = true
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.backgroundColor = UIColor.orange
    }
    
    func cancelButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func submitButtonPressed() {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



