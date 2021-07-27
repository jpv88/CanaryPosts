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
    
    func showDetailView() {
        
    }
        
}
