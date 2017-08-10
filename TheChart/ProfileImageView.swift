//
//  ProfileImageView.swift
//  TheChart
//
//  Created by Ariela Cohen on 7/31/17.
//  Copyright © 2017 Ariela Cohen. All rights reserved.
//

import UIKit

class ProfileImageView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let reuseIdentifier = "ImageCell"
    let layout = UICollectionViewFlowLayout()
    let itemsPerRow: CGFloat = 3
    let sectionInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
    var storedImagesArray = [UIImage]()
    var selectedImage = UIImage()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: self.layout)
        delegate = self
        dataSource = self
        setupView()
        
        storedImagesArray = createProfileImages()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return storedImagesArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProfileImageCollectionViewCell
        
        cell.imageView.image = storedImagesArray[indexPath.row]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        let paddingSpace = 20.0
        //        let availableWidth = self.frame.width - 20.0
        //        print ("frame width: \(self.frame.width)")
        //        print ("available Width = \(availableWidth)")
        //        let widthPerItem = availableWidth / 3.0
        //        print ("widthPerItem = \(widthPerItem)")
        
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = (self.frame.width - paddingSpace)
        let widthPerItem = availableWidth/itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ProfileImageCollectionViewCell
    
        selectedImage = cell.imageView.image!
        hideView()
    }
    
    func setupView() {
        
        self.backgroundColor = UIColor.black
        
        // set up cell
        register(ProfileImageCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func createProfileImages() -> [UIImage] {
        
        var imagesArray = [UIImage]()
        
        imagesArray.append(#imageLiteral(resourceName: "Gabrielle"))
        imagesArray.append(#imageLiteral(resourceName: "noun_215705_cc"))
        imagesArray.append(#imageLiteral(resourceName: "noun_675961_cc"))
        
        return imagesArray
    }
    
    func hideView(){
        self.isHidden = true
    }
    
    
}



