//
//  DefaultHomeCoordinatorMock.swift
//  CanaryPostsTests
//
//  Created by Jared Perez Vega on 30/7/21.
//

import XCTest
@testable import CanaryPosts

class DefaultHomeCoordinatorMock: HomeCoordinator {
    
    var viewController: BaseViewController
    var isHomeCoordinatorTestCalled = false
    
    init(viewController: BaseViewController) {
        self.viewController = viewController
    }
    
    func showDetailView(selectedPost: PostListModelElement) {
        isHomeCoordinatorTestCalled = true
    }
    
}
