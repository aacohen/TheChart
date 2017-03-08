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
    var viewsArray = [UIView()]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = UIColor.blue
        setupView()
        createStackView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        
        
        childNameLabel.text = "Child Name:"
        childNameLabel.backgroundColor = UIColor.orange
        
        viewsArray.append(childNameLabel)
        
        childAgeLabel.text = "Child Age:"
        childAgeLabel.backgroundColor = UIColor.orange
        viewsArray.append(childAgeLabel)
  
        
        childImageLabel.text = "Child Image"
        childImageLabel.backgroundColor = UIColor.orange
        viewsArray.append(childImageLabel)
        
        nameTextField.placeholder = "Name"
        nameTextField.textAlignment = .center
        nameTextField.backgroundColor = UIColor.gray
        viewsArray.append(nameTextField)
        
        ageTextField.placeholder = "Age"
        ageTextField.textAlignment = .center
        ageTextField.backgroundColor = UIColor.gray
        viewsArray.append(ageTextField)
        
        submitButton.titleLabel?.text = "Submit"
        submitButton.backgroundColor = UIColor.orange
        viewsArray.append(submitButton)
    }
    
    func createStackView() {
        
        let stackView = UIStackView(arrangedSubviews: viewsArray)
//        stackView.axis = .vertical
//        stackView.distribution = .fillEqually
//        stackView.alignment = .fill
//        stackView.spacing = 5
        childNameLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.10)
        childNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.40)
        nameTextField.leadingAnchor.constraint(equalTo: childNameLabel.trailingAnchor)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
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
