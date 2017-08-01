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
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: self.layout)
        delegate = self
        dataSource = self
        setupView()
        
        storedImagesArray = retrieveProfileImages()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProfileImageCollectionViewCell

        cell.imageView.image = storedImagesArray[indexPath.row]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = self.frame.width - paddingSpace
        print ("available width: \(availableWidth)")
        let widthPerItem = availableWidth / itemsPerRow
        
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

    func setupView() {
        
        self.backgroundColor = UIColor.black

        // set up cell
        register(ProfileImageCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    
}
    
        func retrieveProfileImages() -> [UIImage] {
            var imageArray = [UIImage]()
            let fileManager = FileManager.default
            let bundleURL = Bundle.main.bundleURL
            let assetURL = bundleURL.appendingPathComponent("Assests.xcassets")
    
            let contents = try! fileManager.contentsOfDirectory(at: assetURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: .skipsHiddenFiles)
    
            for item in contents
            {
                let data = try? Data(contentsOf: item)
                let image: UIImage = UIImage(data: data!)!
                imageArray.append(image)
            }
            print ("retrieved images")
            
            return imageArray
        }

}


