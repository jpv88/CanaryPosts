//
//  DefaultHomeViewControllerMock.swift
//  CanaryPostsTests
//
//  Created by Jared Perez Vega on 30/7/21.
//

import XCTest
@testable import CanaryPosts

class DefaultHomeViewControllerMock: BaseViewController, HomeViewController {
    
    var isHomeViewControllerTestCalled = false
    
    func showLoadedInfo(input: PostListModel) {
        isHomeViewControllerTestCalled = true
    }
    
    func showThisError(error: Error) {
        isHomeViewControllerTestCalled = true
    }
    
        
    

    
}
