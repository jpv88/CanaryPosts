//
//  BasePersistentDataManager.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 28/7/21.
//

import Foundation
import CoreData

class BasePersistentDataManager {
    
    internal let container : NSPersistentContainer!
    
    init(dataBaseName: String) {
        container = NSPersistentContainer(name: dataBaseName)
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
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
