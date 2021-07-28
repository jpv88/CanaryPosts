//
//  ListPostsInteractor.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import Foundation

class ListPostsInteractor: OutputInteractor<ListPostsInteractor.Output> {
    
    typealias Output = PostListModel
    
    private let webService: WebService
    private let localDataManager: PersistentDataManager
    
    init(webService: WebService, localDataManager: PersistentDataManager) {
        self.webService = webService
        self.localDataManager = localDataManager
        super.init()
    }
    
    override func execute() async throws -> Output {
        do {
            let postsList = try await webService.load(type: PostListModel.self, endpoint: .ListPosts)
            try await saveDataInLocal(input: postsList)
            return postsList
        } catch {
            throw MyCustomError.ApiError("Api Error")
        }
    }
    
    private func saveDataInLocal(input: PostListModel) async throws {
        input.forEach { element in
            if let id = element.id, let exactlyID = Int(exactly: id), let userId = element.userId, let exactlyUserId = Int(exactly: userId), let title = element.title, let body = element.body {
                localDataManager.savePost(id: exactlyID, userId: exactlyUserId, title: title, body: body)
            }
        }
    }
    
}
