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
    private let commentsInteractor: GetCommentsByIDInteractor
    
    init(view: DetailViewController, post: PostListModelElement, usersInfoInteractor: GetUserByIdInteractor, commentsInteractor: GetCommentsByIDInteractor) {
        self.view = view
        self.post = post
        self.usersInfoInteractor = usersInfoInteractor
        self.commentsInteractor = commentsInteractor
    }
    
    func onViewDidLoad() {
        guard let userID = post.userId, let id = post.id else { return }
        showPostInfo()
        async {
            do {
                await view?.showLoader()
                let user = try await usersInfoInteractor.execute(input: userID)
                showOwnerInfo(name: user.name ?? "")
                let comments = try await commentsInteractor.execute(input: id)
                showCommentsInfo(input: comments)
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
    
    private func showCommentsInfo(input: CommentsModel) {
        view?.showComments(input: input)
    }
    
}
