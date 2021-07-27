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
    
    func registerCoordinator() {
        injector.register(HomeCoordinator.self) { (r: ResolverInjection, view: BaseViewController) in
            DefaultHomeCoordinator(resolver: r, viewController: view)
        }
    }
    
    func registerViewModel() {
        injector.register(HomeViewModel.self) { (r: ResolverInjection, view: DefaultHomeViewController) in
            let homeView = view as HomeViewController
            let baseVC = view as BaseViewController
            guard let coordinator = r.resolve(HomeCoordinator.self, argument: baseVC) else {
                fatalError("Invalid args!")
            }
            guard let listPostsInteractor = r.resolve(ListPostsInteractor.self) else {
                fatalError("Invalid args!")
            }
            let viewModel = DefaultHomeViewModel(
                view: homeView,
                coordinator: coordinator,
                listPostsInteractor: listPostsInteractor
            )
            return viewModel
        }
    }
    
    func registerViewController() {
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
