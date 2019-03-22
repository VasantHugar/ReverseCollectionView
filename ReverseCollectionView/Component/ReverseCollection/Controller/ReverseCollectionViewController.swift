//
//  ReverseCollectionViewController.swift
//  ReverseCollectionView
//
//  Created by Vasant Hugar on 09/02/19.
//  Copyright © 2019 Vasant Hugar. All rights reserved.
//

import UIKit

class ReverseCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var model = ReverseCollectionModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        showNavigation()
        addListener()
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        activityIndicator.startAnimating()
        model.refresh()
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        FirebaseAuthHelper.shared.delete { (success) in
            self.navigationController?.popToRootViewController(animated: false)
        }
    }
}

extension ReverseCollectionViewController {
    
    /// Add Even Listener
    private func addListener() {
        model.reloadData {
            self.activityIndicator.stopAnimating()
            self.collectionView.reloadData()
            self.scrollToBottom()
        }
    }
    
    /// Scroll First indexPath to Bottom
    private func scrollToBottom() {

        if model.employees.count != 0 {
            let indexPath = IndexPath(row: 0, section: 0)
            self.collectionView.selectItem(at: indexPath,
                                           animated: false,
                                           scrollPosition: UICollectionView.ScrollPosition.bottom)
        }
    }
}

extension ReverseCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.employees.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReverseCollectionViewCell", for: indexPath) as? ReverseCollectionViewCell {
            cell.tag = indexPath.row
            cell.update(withEmployee: model.employees[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ReverseCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
