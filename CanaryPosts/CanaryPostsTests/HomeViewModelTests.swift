//
//  HomeViewModelTests.swift
//  CanaryPostsTests
//
//  Created by Jared Perez Vega on 30/7/21.
//

import XCTest
@testable import CanaryPosts

class HomeViewModelTests: XCTestCase {
    
    var viewModel: DefaultHomeViewModel!
    var viewController: DefaultHomeViewControllerMock!
    var coordinator: DefaultHomeCoordinatorMock!
    
    private let listPostsInteractor = ListPostsInteractorMock(webService: WebService(), localDataManager: DefaultPersistentDataManager(dataBaseName: Constants.CoreData.postDataBase))
    
    override func setUpWithError() throws {
      try super.setUpWithError()
        viewController = buildViewController()
        coordinator = buildCoordinator(baseVC: viewController)
        viewModel = buildViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        viewController = nil
        coordinator = nil
      try super.tearDownWithError()
    }
    
    func testHomeOnViewDidLoadCallsViewController() throws {
        viewModel.onViewDidLoad()
        let viewControllerExpectation = XCTestExpectation(description: "testVCShouldAppear")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            viewControllerExpectation.fulfill()
        })
        wait(for: [viewControllerExpectation], timeout: 1.5)
        XCTAssertTrue(viewController.isHomeViewControllerTestCalled)
    }
    
    func testHomeSomePostPressedCallsCoordinator() throws {
        viewModel.somePostPressed(post: PostListModel.getSingleElementStub())
        Thread.sleep(forTimeInterval: 1)
        XCTAssertTrue(coordinator.isHomeCoordinatorTestCalled)
    }
    
    private func buildCoordinator(baseVC: BaseViewController) -> DefaultHomeCoordinatorMock {
        return DefaultHomeCoordinatorMock(viewController: baseVC)
    }

    private func buildViewController() -> DefaultHomeViewControllerMock {
        return DefaultHomeViewControllerMock()
    }

    private func buildViewModel() -> DefaultHomeViewModel? {
        return DefaultHomeViewModel(
            view: viewController,
            coordinator: coordinator,
            listPostsInteractor: listPostsInteractor
        )
    }

}
