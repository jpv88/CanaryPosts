//
//  GetCommentsForIDInteractor.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import Foundation

class GetCommentsForIDInteractor: InOutInteractor<GetCommentsForIDInteractor.Input, GetCommentsForIDInteractor.Output> {
    
    typealias Input = Int
    typealias Output = CommentsModel
    
    private let webService: WebService
    private let localDataManager: PersistentDataManager
    
    init(webService: WebService, localDataManager: PersistentDataManager) {
        self.webService = webService
        self.localDataManager = localDataManager
        super.init()
    }
    
    override func execute(input: Input) async throws -> Output {
        do {
            if try await shouldGetDataFromLocal() {
                let commentsList = localDataManager.getComments()
                return try await getCommentsWithPostId(commentsList: commentsList, postId: input)
            } else {
                let commentsList = try await webService.load(type: CommentsModel.self, endpoint: .UsersInfo)
                try await saveDataInLocal(input: commentsList)
                return try await getCommentsWithPostId(commentsList: commentsList, postId: input)
            }
        } catch {
            throw MyCustomError.ApiError("Api Error")
        }
    }
    
    private func getCommentsWithPostId(commentsList: CommentsModel, postId: Int) async throws -> Output {
        let foundedComments = commentsList.filter({ $0.postId == postId })
        if !foundedComments.isEmpty {
            return foundedComments
        } else {
            throw MyCustomError.InternalError("No founded elements!")
        }
    }
    
    private func saveDataInLocal(input: CommentsModel) async throws {
        input.forEach { element in
            if let id = element.id, let postId = element.postId, let name = element.name, let body = element.body, let email = element.email {
                localDataManager.saveComment(postId: postId, id: id, name: name, body: body, email: email)
            }
        }
    }
    
    private func shouldGetDataFromLocal() async throws -> Bool {
        let commentsList = localDataManager.getComments()
        return !commentsList.isEmpty
    }
    
}
