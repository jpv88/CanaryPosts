//
//  ListPostsInteractorMock.swift
//  CanaryPostsTests
//
//  Created by Jared Perez Vega on 30/7/21.
//

import XCTest
@testable import CanaryPosts

class ListPostsInteractorMock: ListPostsInteractor {
    
    override func execute() async throws -> ListPostsInteractor.Output {
        return PostListModel.getStub()
    }
    
}
