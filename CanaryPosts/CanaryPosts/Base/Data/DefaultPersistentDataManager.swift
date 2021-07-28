//
//  DefaultPersistentDataManager.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 28/7/21.
//

import Foundation

class DefaultPersistentDataManager: BasePersistentDataManager {}

extension DefaultPersistentDataManager: PersistentDataManager {
    
    func savePost(id: Int, userId: Int, title: String, body: String) {
        let context = container.viewContext
        let postReference = Post(context: context)
        postReference.title = title
        postReference.body = body
        postReference.id = Int16(id)
        postReference.userId = Int16(userId)
        do {
            try context.save()
            print("Post \(id) guardado")
        } catch {
            fatalError("Error saving post - \(error)")
        }
    }
    
}
