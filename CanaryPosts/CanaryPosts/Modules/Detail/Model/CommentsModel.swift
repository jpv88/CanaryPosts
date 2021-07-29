//
//  CommentsModel.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import Foundation

// MARK: - CommentsModelElement
@objc class CommentsModelElement: NSObject, Codable {
    let postId, id: Int?
    let name, email, body: String?
    init(id: Int, postId: Int, name: String, email: String, body: String) {
        self.id = id
        self.postId = postId
        self.name = name
        self.email = email
        self.body = body
        super.init()
    }
}

typealias CommentsModel = [CommentsModelElement]
