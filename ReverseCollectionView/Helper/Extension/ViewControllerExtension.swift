//
//  ViewControllerExtension.swift
//  ReverseCollectionView
//
//  Created by Vasant Hugar on 09/02/19.
//  Copyright © 2019 Vasant Hugar. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Show Alert
    ///
    /// - Parameters:
    ///   - title: Title
    ///   - message: message
    func showAlert(_ title: String = "", message: String) {
        
        // create the alert
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // add an action (button)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            // do something like...
        }))
        
        // show the alert
        self.present(alertController, animated: true, completion: nil)
    }
    
    /// Show Navigation
    func showNavigation() {
        self.navigationController?.setNavigationBarHidden(false, animated: false);
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    /// Hide Navigation
    func hideNavigation() {
        self.navigationController?.setNavigationBarHidden(true, animated: false);
        self.navigationController?.navigationBar.isTranslucent = true
    }
}
