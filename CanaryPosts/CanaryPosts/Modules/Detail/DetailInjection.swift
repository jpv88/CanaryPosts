//
//  DetailInjection.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import Foundation

internal extension Injector {
    
    func registerDetailModule() {
        registerViewModel()
        registerViewController()
    }
    
    private func registerViewModel() {
        injector.register(DetailViewModel.self) { (r: ResolverInjection, view: DefaultDetailViewController, post: PostListModelElement) in
            let detailView = view as DetailViewController
            let viewModel = DefaultDetailViewModel(
                view: detailView,
                post: post
            )
            return viewModel
        }
    }
    
    private func registerViewController() {
        injector.register(DetailViewController.self) { (r: ResolverInjection, post: PostListModelElement) in
            let viewController = DefaultDetailViewController()
            let tableManager = r.resolve(CommentsPostsTableManager.self)
            tableManager?.delegate = viewController
            viewController.tableManager = tableManager
            let viewModel = r.resolve(DetailViewModel.self, arguments: viewController, post)
            viewController.viewModel = viewModel
            return viewController
        }
    }
    
}
