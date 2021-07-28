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
    private let getPostListFromLocalInteractor: GetPostListFromLocalInteractor
    private let shouldGetDataFromLocalInteractor: ShouldGetDataFromLocalInteractor
    
    init(view: HomeViewController, coordinator: HomeCoordinator, listPostsInteractor: ListPostsInteractor, getPostListFromLocalInteractor: GetPostListFromLocalInteractor, shouldGetDataFromLocalInteractor: ShouldGetDataFromLocalInteractor) {
        self.view = view
        self.coordinator = coordinator
        self.listPostsInteractor = listPostsInteractor
        self.getPostListFromLocalInteractor = getPostListFromLocalInteractor
        self.shouldGetDataFromLocalInteractor = shouldGetDataFromLocalInteractor
    }
    
    func onViewDidLoad() {
        async {
            do {
                await view?.showLoader()
                let shouldGetDataFromLocal = try await shouldGetDataFromLocalInteractor.execute()
                if shouldGetDataFromLocal {
                    let listPosts = try await getPostListFromLocalInteractor.execute()
                    view?.showLoadedInfo(input: listPosts)
                } else {
                    let listPosts = try await listPostsInteractor.execute()
                    view?.showLoadedInfo(input: listPosts)
                }
                await view?.hideLoader()
            } catch  {
                view?.showThisError(error: error)
            }
        }
        
    }
    
    func somePostPressed(post: PostListModelElement) {
        print("Pressed post: \(post)")
    }
    
}
