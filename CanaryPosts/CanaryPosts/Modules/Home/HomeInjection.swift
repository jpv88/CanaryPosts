//
//  HomeInjection.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import Foundation

internal extension Injector {
    
    func registerHomeModule() {
        registerCoordinator()
        registerViewModel()
        registerViewController()
    }
    
    private func registerCoordinator() {
        injector.register(HomeCoordinator.self) { (r: ResolverInjection, view: BaseViewController) in
            DefaultHomeCoordinator(resolver: r, viewController: view)
        }
    }
    
    private func registerViewModel() {
        injector.register(HomeViewModel.self) { (r: ResolverInjection, view: DefaultHomeViewController) in
            let homeView = view as HomeViewController
            let baseVC = view as BaseViewController
            guard let coordinator = r.resolve(HomeCoordinator.self, argument: baseVC) else {
                fatalError("Invalid args!")
            }
            guard let listPostsInteractor = r.resolve(ListPostsInteractor.self) else {
                fatalError("Invalid args!")
            }
            guard let getPostListFromLocalInteractor = r.resolve(GetPostListFromLocalInteractor.self) else {
                fatalError("Invalid args!")
            }
            guard let shouldGetDataFromLocalInteractor = r.resolve(ShouldGetDataFromLocalInteractor.self) else {
                fatalError("Invalid args!")
            }
            let viewModel = DefaultHomeViewModel(
                view: homeView,
                coordinator: coordinator,
                listPostsInteractor: listPostsInteractor,
                getPostListFromLocalInteractor: getPostListFromLocalInteractor,
                shouldGetDataFromLocalInteractor: shouldGetDataFromLocalInteractor
            )
            return viewModel
        }
    }
    
    private func registerViewController() {
        injector.register(HomeViewController.self) { r in
            let viewController = DefaultHomeViewController()
            let tableManager = r.resolve(ListPostsTableManager.self)
            tableManager?.delegate = viewController
            viewController.tableManager = tableManager
            let viewModel = r.resolve(HomeViewModel.self, argument: viewController)
            viewController.viewModel = viewModel
            return viewController
        }
    }
    
}
