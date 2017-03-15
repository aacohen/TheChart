//
//  AddChildViewController.swift
//  TheChart
//
//  Created by Ariela Cohen on 3/8/17.
//  Copyright © 2017 Ariela Cohen. All rights reserved.
//

import UIKit

class AddChildViewController: UIViewController {
    
    let childNameLabel = UILabel()
    let childAgeLabel = UILabel()
    let childImageLabel = UILabel()
    let nameTextField = UITextField()
    let ageTextField = UITextField()
    
    let submitButton = UIButton()
    
    var childArray = [Child]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = UIColor.blue
        setupView()
        
        // Do any additional setup after loading the view.
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
        
  
        view.addSubview(childImageLabel)
        childImageLabel.translatesAutoresizingMaskIntoConstraints = false
        childImageLabel.centerXAnchor.constraint(equalTo: childNameLabel.centerXAnchor).isActive = true
        childImageLabel.centerYAnchor.constraint(equalTo: childAgeLabel.centerYAnchor, constant: 40).isActive = true
        childImageLabel.text = "Child Image"
        childImageLabel.backgroundColor = UIColor.orange
        
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
        
        
        view.addSubview(submitButton)
        submitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.centerYAnchor.constraint(equalTo: childImageLabel.centerYAnchor, constant: 50).isActive = true
        submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        submitButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        submitButton.heightAnchor.constraint(equalTo: submitButton.widthAnchor, multiplier: 0.25).isActive = true
        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = UIColor.orange
        
    }
    
    func submitButtonPressed() {
        //validate fields?
        guard let name = nameTextField.text, let age = ageTextField.text else { return }
        
        let child = Child(name: name, age: age)
        childArray.append(child)
     //add to core data
        print(childArray)
        print("submit button pressed")
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
