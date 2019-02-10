//
//  ImageExtension.swift
//  ReverseCollectionView
//
//  Created by Vasant Hugar on 10/02/19.
//  Copyright © 2019 Vasant Hugar. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /// Set Image
    ///
    /// - Parameters:
    ///   - url: URL String
    ///   - completion: returns after Downloding Success/Failed
    func setImage(from url: String, completion: @escaping () -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    completion()
                    return
            }
            
            DispatchQueue.main.async() {
                self.image = image
                completion()
            }
            }.resume()
    }
    
    /// Make View Rounded
    func rounded() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
    }
}
