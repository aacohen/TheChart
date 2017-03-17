//
//  HomeViewController.swift
//  TheChart
//
//  Created by Ariela Cohen on 3/6/17.
//  Copyright © 2017 Ariela Cohen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let sharedChildModel = CoreDataModel.shared
    var tableView: UITableView  =   UITableView()
    var children = [Child]()
    
//    let defaultChild = Child(name: "Add Child", age: "")
    //    let cellReuseIdendifier = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
//        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        // Do any additional setup after loading the view.
        
        let defaultChild = Child(context: sharedChildModel.context)
        defaultChild.name = "Add Child"
        defaultChild.age = ""
        sharedChildModel.saveContext()
        children.append(defaultChild)
        tableView.reloadData()
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //     MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return children.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        
        if indexPath.row == 0 {
            // add child cell
            cell.nameLabel.text = "Add Child"
            cell.profileImage.backgroundColor = UIColor.darkGray
            return cell
        }
        
        //            cell.nameLabel.text = "Name: Hello"
        cell.nameLabel.text = "Name: \(children[indexPath.row].name)"
        
        //            print("\(children[1].name)")
        cell.ageLabel.text = "Age: 2"
        //            cell.ageLabel.text = children[indexPath.row].age
        // cell.profileImage.image = children[indexPath.row].image
        
        cell.backgroundColor = UIColor.blue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            goToAddChild()
            
        }
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.height * 0.2
    }
    
    // MARK: - PUSH TO ADD CHILD VIEW CONTROLLER
    func goToAddChild(){
        let destVC = AddChildViewController()
            navigationController?.pushViewController(destVC, animated: true)
    }

}

