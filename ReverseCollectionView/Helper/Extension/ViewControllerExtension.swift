//
//  ViewControllerExtension.swift
//  ReverseCollectionView
//
//  Created by Vasant Hugar on 09/02/19.
//  Copyright © 2019 Vasant Hugar. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - Alert Message
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
    
    func showNavigation() {
        self.navigationController?.setNavigationBarHidden(false, animated: false);
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func hideNavigation() {
        self.navigationController?.setNavigationBarHidden(true, animated: false);
        self.navigationController?.navigationBar.isTranslucent = true
    }
}
