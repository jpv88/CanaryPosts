//
//  PostListModelStubs.swift
//  CanaryPostsTests
//
//  Created by Jared Perez Vega on 30/7/21.
//

import XCTest
@testable import CanaryPosts

extension PostListModel {
    static func getStub() -> PostListModel {
        return [
            PostListModelElement(id: 1, userId: 1, title: "Title1", body: "Body1"),
            PostListModelElement(id: 2, userId: 2, title: "Title2", body: "Body2")
        ]
    }
    
    static func getSingleElementStub() -> PostListModelElement {
        return PostListModelElement(id: 1, userId: 1, title: "Title1", body: "Body1")
    }
}
