//
//  FirebaseRealtimeDatabaseHelper.swift
//  ReverseCollectionView
//
//  Created by Vasant Hugar on 11/02/19.
//  Copyright © 2019 Vasant Hugar. All rights reserved.
//

import Firebase

class FirebaseRealtimeDatabaseHelper: NSObject {
    
    private static let ref: DatabaseReference = Database.database().reference()
    
    /// Fetch Employee from Realtime Database
    ///
    /// - Parameter completion: return Array of Employee if success else error
    static func fetchEmployees(_ completion: @escaping (_ employees: [[String: Any]]?, _ error: Error?) -> Void) {
        
        ref.child("employees").observeSingleEvent(of: .value, with: { (snapshot) in
            if let data = snapshot.value as? [String: Any], let employees = data["data"] as? [[String: Any]] {
                print("\n\nValue: \(data)\n\n")
                completion(employees, nil)
            } else {
                completion(nil, nil)
            }
        }) { (error) in
            print("\n\nFetch Employee Error: \(error.localizedDescription)\n\n")
            completion(nil, error)
        }
    }
}
