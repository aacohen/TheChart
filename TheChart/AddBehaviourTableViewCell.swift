//
//  AddBehaviourTableViewCell.swift
//  TheChart
//
//  Created by Ariela Cohen on 10/30/17.
//  Copyright © 2017 Ariela Cohen. All rights reserved.
//

import UIKit

class AddBehaviourTableViewCell: UITableViewCell {
    
    

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

    
    
    func layoutElements() {
        self.contentView.backgroundColor = UIColor.red
        
        
    }

    
}
