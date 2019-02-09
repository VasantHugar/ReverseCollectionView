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
        hideNavigation()
        
        FirebaseAuthHelper.shared.addChangeListener()
        //        FirebaseAuthHelper.shared.delete()
        
        UIView.animate(withDuration: 0.3) {
            if FirebaseAuthHelper.shared.userId == nil {
                self.performSegue(withIdentifier: "LandingToAuthSegue", sender: nil)
            } else {
                self.performSegue(withIdentifier: "LandingToCollectionSegue", sender: nil)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

