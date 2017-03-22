//
//  ChildProfileViewController.swift
//  TheChart
//
//  Created by Ariela Cohen on 3/20/17.
//  Copyright © 2017 Ariela Cohen. All rights reserved.
//

import UIKit

class ChildProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var tableView: UITableView  =   UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        tableView.delegate      =   self
        tableView.dataSource    =   self
        self.view.addSubview(self.tableView)
        tableView.register(ChildProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.register(ChildProfileTableViewCell.self, forCellReuseIdentifier: "profileCell")
        


        // Do any additional setup after loading the view.
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
        
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ChildProfileTableViewCell
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // Dequeue with the reuse identifier
        let headerCell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        let header = headerCell as! ChildProfileHeaderView
        
        return header
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
