//
//  ProfileImageCollectionViewCell.swift
//  TheChart
//
//  Created by Ariela Cohen on 8/1/17.
//  Copyright © 2017 Ariela Cohen. All rights reserved.
//

import UIKit

class ProfileImageCollectionViewCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.red
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
