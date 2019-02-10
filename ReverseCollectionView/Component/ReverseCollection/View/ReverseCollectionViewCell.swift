//
//  ReverseCollectionViewCell.swift
//  ReverseCollectionView
//
//  Created by Vasant Hugar on 09/02/19.
//  Copyright © 2019 Vasant Hugar. All rights reserved.
//

import UIKit

class ReverseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    /// Update Cell content with Employee Object
    ///
    /// - Parameter employee: Employee
    func update(withEmployee employee: Employee) {
        
        nameLabel.text = employee.name
        emailLabel.text = employee.email
        phoneLabel.text = employee.phone
        
        setImage(withURL: employee.pic)
        
        self.layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.rounded()
    }
}

extension ReverseCollectionViewCell {
    
    /// Set Image to UIImageView, Download image if url else set Placeholder Image
    ///
    /// - Parameter url: String type
    private func setImage(withURL url: String?) {
        
        guard let url = url, url.count != 0 else {
            imageView.image = UIImage(named: "placeholde_icon")
            return
        }
        
        activityIndicator.startAnimating()
        imageView.setImage(from: url) {
            self.activityIndicator.stopAnimating()
        }
    }
}
