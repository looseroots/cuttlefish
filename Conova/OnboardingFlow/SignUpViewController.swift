//
//  SignUpViewController.swift
//  Conova
//
//  Created by Kevin Bunarjo on 9/7/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    var emailLabel: UILabel!
    var emailText: UITextField!
    var passwordLabel: UILabel!
    var passwordText: UITextField!
    var confirmPasswordLabel: UILabel!
    var confirmPasswordText: UITextField!
    var nameLabel: UILabel!
    var nameText: UITextField!
    
    var stackView: UIStackView!
    
    var signUpButton: UIButton!
    var loginButton: UIButton!
    
    override func viewDidLoad() {
        emailLabel = UILabel()
        emailText = UITextField()
        passwordLabel = UILabel()
        passwordText = UITextField()
        confirmPasswordLabel = UILabel()
        confirmPasswordText = UITextField()
        nameLabel = UILabel()
        nameText = UITextField()
        
        stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        signUpButton = UIButton(type: .custom)
        loginButton = UIButton(type: .custom)
    }
}
