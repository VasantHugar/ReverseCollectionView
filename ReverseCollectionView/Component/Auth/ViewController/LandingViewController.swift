//
//  LandingViewController.swift
//  ReverseCollectionView
//
//  Created by Vasant Hugar on 09/02/19.
//  Copyright © 2019 Vasant Hugar. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hideNavigation()
        checkForAuth()
    }
}

extension LandingViewController {
    
    /// Check if Authentication if Auth presents go to CollectiveView else go Login
    private func checkForAuth() {
        
        FirebaseAuthHelper.shared.addChangeListener()
        
        UIView.animate(withDuration: 0.3) {
            if FirebaseAuthHelper.shared.userId == nil {
                self.performSegue(withIdentifier: "LandingToAuthSegue", sender: nil)
            } else {
                self.performSegue(withIdentifier: "LandingToCollectionSegue", sender: nil)
            }
        }
    }
}

