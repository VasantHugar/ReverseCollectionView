//
//  ViewController.swift
//  ReverseCollectionView
//
//  Created by Vasant Hugar on 09/02/19.
//  Copyright © 2019 Vasant Hugar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        FirebaseAuthHelper.shared.addChangeListener()
        FirebaseAuthHelper.shared.delete()
    }
}

