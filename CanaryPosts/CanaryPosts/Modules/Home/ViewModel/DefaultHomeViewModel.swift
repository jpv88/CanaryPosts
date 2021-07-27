//
//  DefaultHomeViewModel.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import Foundation

class DefaultHomeViewModel: HomeViewModel {
    
    private weak var view: HomeViewController?
    private let coordinator: HomeCoordinator
    
    init(view: HomeViewController, coordinator: HomeCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }
    
    func onViewDidLoad() {
        print("View did load")
    }
    
    func somePostPressed(postID: String) {
        
    }
    
}
