//
//  AddBehaviourViewController.swift
//  TheChart
//
//  Created by Ariela Cohen on 10/26/17.
//  Copyright © 2017 Ariela Cohen. All rights reserved.
//

import UIKit

class AddBehaviourViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var child = Child()
    var cancelButton = UIButton()
    var submitButton = UIButton()
//    var scrollView = UIScrollView()
    var tableView: UITableView  =   UITableView()
    var footerView: UITableViewHeaderFooterView = UITableViewHeaderFooterView()
    let sectionHeaders = ["Chore", "Reward", "Length"]
    let data = [["Brush Teeth", "Make Bed", "Get Dressed", "Cleaned Up", "Potty"], [ "Ice Cream", "Toy", "Can choose dinner"], ["5 Days", "7 Days", "10 Days", "2 Weeks", "3 Weeks", "1 Month"]]
    
    var selectedRows = [String: IndexPath]()
    
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
        return sectionHeaders.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            as! AddBehaviourTableViewCell
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionHeaders[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath) as! AddBehaviourTableViewCell
        
        let previousSelectedCellIndexPath = self.addSelectedCellWithSection(indexPath: indexPath)
        if previousSelectedCellIndexPath != nil {
            let previousSelectedCell =  self.tableView.cellForRow(at: previousSelectedCellIndexPath!) as! AddBehaviourTableViewCell
            
            previousSelectedCell.textLabel?.textColor = UIColor.black
            cell.textLabel?.textColor = UIColor.blue
            tableView.deselectRow(at: previousSelectedCellIndexPath!, animated: true)
        } else {
            cell.textLabel?.textColor = UIColor.blue
        }
        print("selected rows: \(selectedRows)")
    }
    
    func addSelectedCellWithSection(indexPath: IndexPath) -> IndexPath? {
        let existingIndexPath = selectedRows["\(indexPath.section)"]
        if (existingIndexPath == nil) {
            selectedRows["\(indexPath.section)"]=indexPath
        }else
        {
            selectedRows["\(indexPath.section)"]=indexPath
            return existingIndexPath
        }
        
        return nil;
    }
//    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        if let selectedIndexPaths = tableView.indexPathsForSelectedRows {
//            for selectedIndexPath in selectedIndexPaths {
//                if selectedIndexPath.section == indexPath.section {
//                    tableView.deselectRow(at: selectedIndexPath, animated: true)
//                }
//            }
//        }
//        return indexPath
//    }
    
    
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
        tableView.allowsMultipleSelection = true

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
//        cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.leadingAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        cancelButton.topAnchor.constraint(equalTo: footerView.topAnchor).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: footerView.bottomAnchor).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo:footerView.trailingAnchor).isActive = true
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.backgroundColor = UIColor.orange
    }
    
//    func cancelButtonPressed() {
//        self.dismiss(animated: true, completion: nil)
//    }
    
    func submitButtonPressed() {
        print("submit")
        var choreName = String()
        var rewardName = String()
        var length = String()
        
        for selection in selectedRows {
            print("selection: \(selection)")
            switch selection.key {
            case "0":
                let cell = self.tableView.cellForRow(at: selection.value)
                guard let name = cell?.textLabel?.text else { return }
                choreName = name
                print("chore name: \(choreName)")
            case "1":
                let cell = self.tableView.cellForRow(at: selection.value)
                guard let name = cell?.textLabel?.text else { return }
                rewardName = name
            case "2":
                let cell = self.tableView.cellForRow(at: selection.value)
                guard let text = cell?.textLabel?.text else { return }
                length = text
                
            default: return
            }
        }
        self.navigationController?.popViewController(animated: true)
        let newChore = Chore(context: CoreDataModel.shared.context)
        newChore.name = choreName
        newChore.rewardName = rewardName
        newChore.lengthTarget = convertToInt(string: length)
        child.addToChore(newChore)
        
        CoreDataModel.shared.saveContext()
        CoreDataModel.shared.chores.append(newChore)
        print("submit pressed")
        
        
    }
    
    func convertToInt(string: String) -> Int32 {
        switch string {
        case "5 Days":
            return 5
        case "7 Days":
            return 7
        case "10 Days":
            return 10
        case "2 weeks":
            return 14
        case "3 weeks":
            return 21
        case "1 month":
            return 28
        default: break
        }
        return 0
    }
}


