//
//  PersistentDataManager.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 28/7/21.
//

import Foundation
import CoreData

class PersistentDataManager {
    
    private let container : NSPersistentContainer!
    
    init() {
        container = NSPersistentContainer(name: Constants.CoreData.postDataBase)
        setupDatabase()
    }
    
    private func setupDatabase() {
        container.loadPersistentStores { (desc, error) in
            if let error = error {
                fatalError("Error loading store \(desc) — \(error)")
            }
            print("Database ready!")
        }
    }

}
