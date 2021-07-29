//
//  CommentsModel.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import Foundation

// MARK: - CommentsModelElement
struct CommentsModelElement: Codable {
    let postId, id: Int?
    let name, email, body: String?
}

typealias CommentsModel = [CommentsModelElement]
