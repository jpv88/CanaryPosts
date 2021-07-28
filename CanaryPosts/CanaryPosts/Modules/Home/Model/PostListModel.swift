//
//  PostListModel.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import Foundation

// MARK: - PostListModelElement
@objc class PostListModelElement: NSObject, Codable {
    let userId, id: Int?
    let title, body: String?
    init(id: Int, userId: Int, title: String, body: String) {
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
        super.init()
    }
}

typealias PostListModel = [PostListModelElement]
