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
    private let listPostsInteractor: ListPostsInteractor
    
    init(view: HomeViewController, coordinator: HomeCoordinator, listPostsInteractor: ListPostsInteractor) {
        self.view = view
        self.coordinator = coordinator
        self.listPostsInteractor = listPostsInteractor
    }
    
    func onViewDidLoad() {
        async {
            do {
                await view?.showLoader()
                let listPosts = try await listPostsInteractor.execute()
                view?.showLoadedInfo(input: listPosts)
                await view?.hideLoader()
            } catch  {
                view?.showThisError(error: error)
            }
        }
        
    }
    
    func somePostPressed(post: PostListModelElement) {
        coordinator.showDetailView(selectedPost: post)
    }
    
}
