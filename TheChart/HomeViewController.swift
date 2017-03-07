//
//  HomeViewController.swift
//  TheChart
//
//  Created by Ariela Cohen on 3/6/17.
//  Copyright © 2017 Ariela Cohen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView  =   UITableView()
    var children = [Child]()
//    let cellReuseIdendifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.rowHeight = 400
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
        
        // Do any additional setup after loading the view.
                let addChild = Child(name: "Add Child", age: "")
                let childOne = Child(name: "Gabrielle", age: "2")
                let childTwo = Child(name: "Ellen", age: "12")
        
                children.append(addChild)
                children.append(childOne)
                children.append(childTwo)
        
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
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
                
            } else {
                
            
//            cell.nameLabel.text = "Name: Hello"
                  cell.nameLabel.text = "Name: \(children[indexPath.row].name)"

//            print("\(children[1].name)")
            cell.ageLabel.text = "Age: 2"
//            cell.ageLabel.text = children[indexPath.row].age
            // cell.profileImage.image = children[indexPath.row].image
    
            cell.backgroundColor = UIColor.blue
            }
            return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.height * 0.25
 
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

//    var children = [Child]()
//    let cellReuseIdendifier = "cell"
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        

//        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: cellReuseIdendifier)
//        
//        
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//        
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    //
//}
//
    
}
    
class Child {
    
    var name = String()
    var age = String()
    //var image = UIImage()
    
    init(name:String, age: String) {
        _ = self.name
        _ = self.age
        
    }

}
