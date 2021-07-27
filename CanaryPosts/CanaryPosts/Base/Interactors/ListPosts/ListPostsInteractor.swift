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
    
    init(webService: WebService) {
        self.webService = webService
        super.init()
    }
    
    override func execute() async throws -> Output {
        do {
            let postsList = try await webService.load(type: PostListModel.self, endpoint: .ListPosts)
            return postsList
        } catch {
            throw MyCustomError.ApiError("Api Error")
        }
    }
    
}
