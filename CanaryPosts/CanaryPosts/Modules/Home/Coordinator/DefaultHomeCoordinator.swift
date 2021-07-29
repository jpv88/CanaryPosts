//
//  DefaultHomeCoordinator.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import Foundation

class DefaultHomeCoordinator: HomeCoordinator {
    
    var viewController: BaseViewController
    
    private let resolver: ResolverInjection!
    
    init(resolver: ResolverInjection, viewController: BaseViewController) {
        self.resolver = resolver
        self.viewController = viewController
    }
    
    func showDetailView(selectedPost: PostListModelElement) {
        guard let detailViewController = resolver.resolve(DetailViewController.self, argument: selectedPost) as? DefaultDetailViewController else { return }
        DispatchQueue.main.async { [weak self] in
            self?.viewController.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
        
}
