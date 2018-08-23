//
//  ChartViewCell.swift
//  TheChart
//
//  Created by Ariela Cohen on 5/7/18.
//  Copyright © 2018 Ariela Cohen. All rights reserved.
//

import Foundation
import UIKit

class ChartViewCell: UITableViewCell {
    
    
    var choreImage = UIImageView()
    var choreName = UILabel()
    var starView: UICollectionView!
    var containerView = UIView()
    
    var rewardsView = UIView()
//    var rewardImage = UIImageView()
    var rewardLabel = UILabel()
    
    // Static
    let padding:Int = 10
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layoutElements()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layoutElements()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutElements()
        
    }
    
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: CGFloat(padding), left: CGFloat(padding), bottom: CGFloat(padding), right: CGFloat(padding))
        
//        layout.itemSize = CGSize(width: 90, height: 120)
        
//        starView = UICollectionView(frame: containerView.frame)
        starView = UICollectionView(frame: containerView.frame, collectionViewLayout: layout)
        
        starView.delegate = dataSourceDelegate
        starView.dataSource = dataSourceDelegate
        starView.register(StarViewCell.self, forCellWithReuseIdentifier: "starCell")
        containerView.addSubview(starView)
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        starView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        starView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        starView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        starView.backgroundColor = UIColor.white
        starView.tag = row
        starView.reloadData()
    }
    
    func layoutElements() {
  
        self.contentView.addSubview(choreName)
        choreName.translatesAutoresizingMaskIntoConstraints = false
        choreName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
//        choreName.trailingAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        choreName.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25).isActive = true
       choreName.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.20).isActive = true
//        choreName.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        choreName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        choreName.backgroundColor = UIColor.red
        
        self.contentView.addSubview(choreImage)
        choreImage.translatesAutoresizingMaskIntoConstraints = false
        choreImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        choreImage.bottomAnchor.constraint(equalTo: choreName.topAnchor).isActive = true
        choreImage.trailingAnchor.constraint(equalTo: choreName.trailingAnchor).isActive = true
        choreImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        choreImage.backgroundColor = UIColor.orange
        
        self.contentView.addSubview(rewardLabel)
        rewardLabel.translatesAutoresizingMaskIntoConstraints = false
        rewardLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        rewardLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25).isActive = true
        rewardLabel.heightAnchor.constraint(equalTo: choreName.heightAnchor).isActive = true
        rewardLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        rewardLabel.backgroundColor = UIColor.red

        self.contentView.addSubview(rewardsView)
        rewardsView.translatesAutoresizingMaskIntoConstraints = false
        rewardsView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        rewardsView.bottomAnchor.constraint(equalTo: rewardLabel.topAnchor).isActive = true
        rewardsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        rewardsView.leadingAnchor.constraint(equalTo: rewardLabel.leadingAnchor).isActive = true
        rewardsView.backgroundColor = UIColor.orange

        self.contentView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: choreName.trailingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: rewardLabel.leadingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        

    }
}
