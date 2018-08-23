//
//  ChildProfileViewController.swift
//  TheChart
//
//  Created by Ariela Cohen on 3/20/17.
//  Copyright © 2017 Ariela Cohen. All rights reserved.
//

import UIKit

class ChildProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let sharedChildModel = CoreDataModel.shared
    
    var child: Child!
    
    var header: UIView = UIView()
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? ChartViewCell else { return }

        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.height * 0.15
    }
    
    @objc func addBehaviourButtonPressed() {
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
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
}

extension ChildProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let width = (collectionView.frame.width - 20)/7
        
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("number of items in sections \(Int(sharedChildModel.chores[collectionView.tag].lengthTarget))")
        return Int(sharedChildModel.chores[collectionView.tag].lengthTarget)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "starCell", for: indexPath) as! StarViewCell
        
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    
    
}

class StarViewCell: UICollectionViewCell {
    
    var starView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(starView)
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        starView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        starView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        starView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
        starView.image = #imageLiteral(resourceName: "STAR")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    

}
