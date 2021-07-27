//
//  PostListModel.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import Foundation

// MARK: - PostListModelElement
struct PostListModelElement: Codable {
    let userId, id: Int?
    let title, body: String?
}

typealias PostListModel = [PostListModelElement]
