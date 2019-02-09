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
        
        contentView?.layer.borderColor = UIColor.lightGray.cgColor
        contentView?.layer.borderWidth = 1.0
        contentView?.layer.cornerRadius = 5.0
        contentView?.layer.masksToBounds = true
        
        loginButton.layer.cornerRadius = 5.0
        loginButton.layer.masksToBounds = true
        
        updateButtonTitle()
    }
    
    @IBAction func segmentControlValueChangeHandler(_ sender: UISegmentedControl) {
        updateButtonTitle()
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        checkMandatoryData()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension AuthenticationViewController {
    
    private func updateButtonTitle() {
        let selectedIndex = segmentControl.selectedSegmentIndex
        loginButton.setTitle(segmentControl.titleForSegment(at: selectedIndex), for: .normal)
    }
    
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
    
    private func authenticate(withEmail email: String, andPassword password: String) {
        
        switch AuthenticationType(rawValue: segmentControl.selectedSegmentIndex)! {
        case .login:
            FirebaseAuthHelper.shared.signin(email: email, password: password) { (error) in
                if let error = error {
                    self.showAlert("Error", message: error.localizedDescription)
                } else {
                    self.goToCollectionViewController()
                }
            }
            break
            
        case .register:
            FirebaseAuthHelper.shared.createUser(email: email, password: password) { (error) in
                if let error = error {
                    self.showAlert("Error", message: error.localizedDescription)
                } else {
                    self.goToCollectionViewController()
                }
            }
            break
        }
    }
    
    private func goToCollectionViewController() {
        performSegue(withIdentifier: "ToCollectionSegue", sender: nil)
    }
}
