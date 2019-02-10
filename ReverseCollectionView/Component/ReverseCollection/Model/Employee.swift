//
//  Employee.swift
//  ReverseCollectionView
//
//  Created by Vasant Hugar on 10/02/19.
//  Copyright © 2019 Vasant Hugar. All rights reserved.
//

import UIKit

class Employee: NSObject {
    
    var id: Int?
    
    var name = ""
    
    var email = ""
    
    var phone = ""
    
    var accupation = ""
    
    var pic: String?
    
    private override init() {
    }
    
    init(dictionary: [String: Any]) {
        
        if let id = dictionary["id"] as? Int {
            self.id = id
        }
        
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        
        if let email = dictionary["email"] as? String {
            self.email = email
        }
        
        if let phone = dictionary["phone"] as? String {
            self.phone = phone
        }
        
        if let accupation = dictionary["accupation"] as? String {
            self.accupation = accupation
        }
        
        if let pic = dictionary["pic"] as? String {
            self.pic = pic
        }
    }
}
