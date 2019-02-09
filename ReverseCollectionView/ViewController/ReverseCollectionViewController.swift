//
//  ReverseCollectionViewController.swift
//  ReverseCollectionView
//
//  Created by Vasant Hugar on 09/02/19.
//  Copyright © 2019 Vasant Hugar. All rights reserved.
//

import UIKit

class ReverseCollectionViewController: UIViewController {
    
    var employees: [Employee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        showNavigation()
    
        for index in 0...9 {
            
            let temp = Employee()
            temp.id = index
            temp.name = "Employee \(index)"
            temp.email = "employee_\(1)@gmail.com"
            temp.phone = "123455667\(index)"
            temp.accupation = "Software Developer"
            temp.profileImage = UIImage(named: "user_image\(index)")
            
            employees.append(temp)
        }
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

extension ReverseCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return employees.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReverseCollectionViewCell", for: indexPath) as? ReverseCollectionViewCell {
            cell.update(withEmployee: employees[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ReverseCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
