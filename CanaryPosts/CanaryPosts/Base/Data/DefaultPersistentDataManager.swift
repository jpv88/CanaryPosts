//
//  DefaultPersistentDataManager.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 28/7/21.
//

import Foundation
import CoreData

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
    
    func getPosts() -> PostListModel {
        let fetchRequest : NSFetchRequest<Post> = Post.fetchRequest()
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            return getPostListModelFrom(input: result)
        } catch {
            print("Getting Post error - \(error)")
        }
        return []
    }
    
    private func getPostListModelFrom(input: [Post]) -> PostListModel {
        var result: PostListModel = []
        input.forEach { post in
            let element = PostListModelElement(id: Int(post.id), userId: Int(post.userId), title: post.title ?? "", body: post.body ?? "")
            result.append(element)
        }
        return result
    }
    
}
