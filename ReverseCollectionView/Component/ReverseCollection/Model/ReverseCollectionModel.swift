//
//  ReverseCollectionModel.swift
//  ReverseCollectionView
//
//  Created by Vasant Hugar on 10/02/19.
//  Copyright © 2019 Vasant Hugar. All rights reserved.
//

import Foundation

class ReverseCollectionModel {
    
    var employees: [Employee] = []
    
    private var completion: (() -> Void)?
    
    init() {
        fetchData()
    }
    
    /// Fetch Employee Data from RealTime Database
    private func fetchData() {
        resetEmployeeData()
        FirebaseRealtimeDatabaseHelper.fetchEmployees { (employees, error) in
            if let employees = employees {
                for employee in employees {
                    self.employees.append(Employee(dictionary: employee))
                }
            }
            self.completion?()
        }
    }
    
    /// Reset the Employee Data while refreshing
    private func resetEmployeeData() {
        employees = []
        completion?()
    }
}

extension ReverseCollectionModel {
    
    /// Refresh the Data Realtime Database
    func refresh() {
        fetchData()
    }
    
    /// Reload Data after successfully fetching
    ///
    /// - Parameter completion: Block
    func reloadData(_ completion: (() -> Void)?) {
        self.completion = completion
    }
}
