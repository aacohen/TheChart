//
//  AddChildViewController.swift
//  TheChart
//
//  Created by Ariela Cohen on 3/8/17.
//  Copyright © 2017 Ariela Cohen. All rights reserved.
//

import UIKit
import CoreData

class AddChildViewController: UIViewController, UICollectionViewDelegate {

    var profileImageView: ProfileImageView!
    let childNameLabel = UILabel()
    let childAgeLabel = UILabel()
    let childImageLabel = UILabel()
    var imageDisplayView = UIImageView()
    let childChooseImageButton = UIButton()
    var imageView = UIImageView()
    let nameTextField = UITextField()
    let ageTextField = UITextField()
    
    let submitButton = UIButton()
    
    var childArray = [Child]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = UIColor.blue
        setupView()
    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        
        view.addSubview(childNameLabel)
        childNameLabel.translatesAutoresizingMaskIntoConstraints = false
        childNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: view.frame.width * -0.25).isActive = true
        childNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: view.frame.height * -0.2).isActive = true
        childNameLabel.text = "Child Name:"
        childNameLabel.backgroundColor = UIColor.orange
        
       
        view.addSubview(childAgeLabel)
        childAgeLabel.translatesAutoresizingMaskIntoConstraints = false
        childAgeLabel.centerXAnchor.constraint(equalTo: childNameLabel.centerXAnchor).isActive = true
        childAgeLabel.centerYAnchor.constraint(equalTo: childNameLabel.centerYAnchor, constant: 40).isActive = true
        childAgeLabel.text = "Child Age:"
        childAgeLabel.backgroundColor = UIColor.orange
        
//        imageDisplayView.image = #imageLiteral(resourceName: "Gabrielle")
       view.addSubview(imageDisplayView)
        imageDisplayView.translatesAutoresizingMaskIntoConstraints = false
        imageDisplayView.centerXAnchor.constraint(equalTo: childNameLabel.centerXAnchor).isActive = true
        imageDisplayView.centerYAnchor.constraint(equalTo: childAgeLabel.centerYAnchor, constant: 40).isActive = true
        imageDisplayView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageDisplayView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageDisplayView.backgroundColor = UIColor.black

        view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.leadingAnchor.constraint(equalTo: childNameLabel.trailingAnchor, constant: 20).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: childNameLabel.centerYAnchor).isActive = true
        nameTextField.placeholder = "Name"
        nameTextField.textAlignment = .center
        nameTextField.backgroundColor = UIColor.gray
        
        view.addSubview(ageTextField)
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.leadingAnchor.constraint(equalTo: childAgeLabel.trailingAnchor, constant: 20).isActive = true
        ageTextField.centerYAnchor.constraint(equalTo: childAgeLabel.centerYAnchor).isActive = true
        ageTextField.placeholder = "Age"
        ageTextField.textAlignment = .center
        ageTextField.backgroundColor = UIColor.gray
        
        view.addSubview(childChooseImageButton)
        childChooseImageButton.addTarget(self, action: #selector(chooseImageButtonPressed), for: .touchUpInside)
        childChooseImageButton.translatesAutoresizingMaskIntoConstraints = false
        childChooseImageButton.leadingAnchor.constraint(equalTo: imageDisplayView.trailingAnchor, constant: 20).isActive = true
        childChooseImageButton.centerYAnchor.constraint(equalTo: imageDisplayView.centerYAnchor).isActive = true
        childChooseImageButton.setTitle("Choose Profile Image", for: .normal)
        childChooseImageButton.addSubview(imageView)
        
        
        view.addSubview(submitButton)
        submitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.centerYAnchor.constraint(equalTo: imageDisplayView.centerYAnchor, constant: 50).isActive = true
        submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        submitButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        submitButton.heightAnchor.constraint(equalTo: submitButton.widthAnchor, multiplier: 0.25).isActive = true
        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = UIColor.orange
        
    
        profileImageView = ProfileImageView()
        view.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        profileImageView.isHidden = true
    
        
    }
    
    func setProfileImageView(){
        if let image = imageDisplayView.image {
            
            imageDisplayView.image = profileImageView.selectedImage
//            imageDisplayView.backgroundColor = UIColor.clear
        
        } else {
            
            print ("no profile image")
            
        }

    }

    
   // MARK: - Navigation
    
    func submitButtonPressed() {
        //validate fields?
        guard let name = nameTextField.text, let age = ageTextField.text else { return }
        
        let newChild = Child(context: CoreDataModel.shared.context)
        newChild.name = name
        newChild.age = age
        let imageData =  UIImagePNGRepresentation(profileImageView.selectedImage)
        newChild.image = imageData! as NSData
        
        CoreDataModel.shared.saveContext()
        CoreDataModel.shared.children.append(newChild)
        
        self.navigationController?.popViewController(animated: true)
     
        print(childArray)
        print("submit button pressed")
    }
    
    func chooseImageButtonPressed() {
        profileImageView.isHidden = false
        print ("Choose image button pressed")
        //unhide collection view
        //chosen image name is stored in "imageName" then put in var "image View"
        //save in core data
    }

}
