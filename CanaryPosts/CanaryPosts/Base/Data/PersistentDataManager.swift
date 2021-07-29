//
//  PersistentDataManager.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 28/7/21.
//

import Foundation

protocol PersistentDataManager {
    func saveComment(postId: Int, id: Int, name: String, body: String, email: String)
    func getComments() -> CommentsModel
    func savePost(id: Int, userId: Int, title: String, body: String)
    func getPosts() -> PostListModel
    func saveUser(id: Int, name: String, username: String, email: String)
    func getUsers() -> UsersModel
}
