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
    
    // MARK: User's
    
    func saveUser(id: Int, name: String, username: String, email: String) {
        let context = container.viewContext
        let userReference = User(context: context)
        userReference.id = Int16(id)
        userReference.name = name
        userReference.username = username
        userReference.email = email
        do {
            try context.save()
            print("User \(id) guardado")
        } catch {
            fatalError("Error saving post - \(error)")
        }
    }
    
    func getUsers() -> UsersModel {
        let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            return getUsersListModelFrom(input: result)
        } catch {
            print("Getting Post error - \(error)")
        }
        return []
    }
    
    // MARK: Post's
    
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
    
    // MARK: Helpers
    
    private func getPostListModelFrom(input: [Post]) -> PostListModel {
        var result: PostListModel = []
        input.forEach { post in
            let element = PostListModelElement(id: Int(post.id), userId: Int(post.userId), title: post.title ?? "", body: post.body ?? "")
            result.append(element)
        }
        return result
    }
    
    private func getUsersListModelFrom(input: [User]) -> UsersModel {
        var result: UsersModel = []
        input.forEach { user in
            let element = UsersModelElement(id: Int(user.id), name: user.name, username: user.username, email: user.email)
            result.append(element)
        }
        return result
    }
    
}
