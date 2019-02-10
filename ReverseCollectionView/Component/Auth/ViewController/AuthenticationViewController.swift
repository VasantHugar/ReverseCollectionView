//
//  AuthenticationViewController.swift
//  ReverseCollectionView
//
//  Created by Vasant Hugar on 09/02/19.
//  Copyright © 2019 Vasant Hugar. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var contentView: UIView?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    enum AuthenticationType: Int {
        case login = 0
        case register
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUIContent()
        updateButtonTitle()
    }
    
    @IBAction func segmentControlValueChangeHandler(_ sender: UISegmentedControl) {
        updateButtonTitle()
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        checkMandatoryData()
    }
}

extension AuthenticationViewController {
    
    /// Set Default Content
    private func setUIContent() {
        
        contentView?.layer.borderColor = UIColor.lightGray.cgColor
        contentView?.layer.borderWidth = 1.0
        contentView?.layer.cornerRadius = 5.0
        contentView?.layer.masksToBounds = true
        
        loginButton.layer.cornerRadius = 5.0
        loginButton.layer.masksToBounds = true
    }
    
    /// Update Login or Register button based on Switch enabled
    private func updateButtonTitle() {
        let selectedIndex = segmentControl.selectedSegmentIndex
        loginButton.setTitle(segmentControl.titleForSegment(at: selectedIndex), for: .normal)
    }
    
    /// Check Mandatory Data entered and Show alert
    private func checkMandatoryData() {
        
        guard let email = emailTextField.text, email.count != 0 else {
            showAlert("Alert", message: "Please enter email id.")
            return
        }
        
        guard let password = passwordTextField.text, password.count != 0 else {
            showAlert("Alert", message: "Please enter password.")
            return
        }
        authenticate(withEmail: email, andPassword: password)
    }
}

extension AuthenticationViewController {
    
    /// Decide type what type of action to be done, Create or Login
    ///
    /// - Parameters:
    ///   - email: Email
    ///   - password: Password
    private func authenticate(withEmail email: String, andPassword password: String) {
        
        switch AuthenticationType(rawValue: segmentControl.selectedSegmentIndex)! {
        case .login:
            login(withEmail: email, andPassword: password)
            break
            
        case .register:
            createUser(withEmail: email, andPassword: password)
            break
        }
    }
    
    /// Login
    ///
    /// - Parameters:
    ///   - email: Email
    ///   - password: Password
    private func login(withEmail email: String, andPassword password: String) {
        
        FirebaseAuthHelper.shared.signin(email: email, password: password) { (error) in
            if let error = error {
                self.showAlert("Error", message: error.localizedDescription)
            } else {
                self.goToCollectionViewController()
            }
        }
    }
    
    /// Create User
    ///
    /// - Parameters:
    ///   - email: Email
    ///   - password: Password
    private func createUser(withEmail email: String, andPassword password: String) {
        
        FirebaseAuthHelper.shared.createUser(email: email, password: password) { (error) in
            if let error = error {
                self.showAlert("Error", message: error.localizedDescription)
            } else {
                self.goToCollectionViewController()
            }
        }
    }
    
    /// Go to CollectionView
    private func goToCollectionViewController() {
        performSegue(withIdentifier: "ToCollectionSegue", sender: nil)
    }
}
