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
    
    let reuseIdentifier = "cell"
    var tableView: UITableView  =   UITableView()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)

        sharedChildModel.fetch()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //     MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sharedChildModel.children.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            as! HomeTableViewCell
        
        
        if let name = sharedChildModel.children[indexPath.row].name {
            cell.nameLabel.text = "Name: \(name)"
        }
        
        if let age = sharedChildModel.children[indexPath.row].age {
            cell.ageLabel.text = "Age: \(age)"
        }
        
        if let imageData = sharedChildModel.children[indexPath.row].image {
            let image = UIImage(data: imageData as Data)
            cell.profileImage.image = image
        }
        
        
        print("\(String(describing: sharedChildModel.children[0].name))")
        
        
        
        cell.backgroundColor = UIColor.blue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            goToAddChild()
        } else {
            guard let name = sharedChildModel.children[indexPath.row].name, let imageData = sharedChildModel.children[indexPath.row].image else { return }
            let age = sharedChildModel.children[indexPath.row].age
            
            guard let image = UIImage(data: imageData as Data) else {return}
            goToChildProfile(name: name, image: image)
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.height * 0.2
    }
    
    
    // MARK: - SWIPE TO DELETE CELL
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) && indexPath.row != 0 {
            // delete data and row
            sharedChildModel.delete(indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    // MARK: - PUSH TO ADD CHILD VIEW CONTROLLER
    func goToAddChild(){
        let destVC = AddChildViewController()
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    func goToChildProfile(name: String, image: UIImage){
        let destVC = ChildProfileViewController()
        destVC.name = name
        destVC.image = image
        navigationController?.pushViewController(destVC, animated: true)
    }
    
}

