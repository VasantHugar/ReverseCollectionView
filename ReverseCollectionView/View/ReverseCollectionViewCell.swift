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
    
    func update(withEmployee employee: Employee) {
        imageView.image = employee.profileImage
        nameLabel.text = employee.name
        emailLabel.text = employee.email
        phoneLabel.text = employee.phone
    }
}
