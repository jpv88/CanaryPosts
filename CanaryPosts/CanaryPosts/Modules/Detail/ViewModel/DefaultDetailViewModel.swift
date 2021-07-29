//
//  DefaultDetailViewModel.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import Foundation

class DefaultDetailViewModel: DetailViewModel {
    
    private weak var view: DetailViewController?
    private let post: PostListModelElement
    private let usersInfoInteractor: GetUserByIdInteractor
    
    init(view: DetailViewController, post: PostListModelElement, usersInfoInteractor: GetUserByIdInteractor) {
        self.view = view
        self.post = post
        self.usersInfoInteractor = usersInfoInteractor
    }
    
    func onViewDidLoad() {
        guard let userID = post.userId else { return }
       showPostInfo()
        
        async {
            do {
                await view?.showLoader()
                let user = try await usersInfoInteractor.execute(input: userID)
                showOwnerInfo(name: user.name ?? "")
                await view?.hideLoader()
            } catch  {
                view?.showThisError(error: error)
            }
        }
    }
    
    private func showPostInfo() {
        guard let title = post.title, let body = post.body else { return }
        view?.showPostInfo(title: title, body: body)
    }
    
    private func showOwnerInfo(name: String) {
        view?.showOwnerInfo(name: name)
    }
    
}
