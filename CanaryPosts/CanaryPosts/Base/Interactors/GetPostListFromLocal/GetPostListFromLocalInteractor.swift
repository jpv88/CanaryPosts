//
//  GetPostListFromLocalInteractor.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 28/7/21.
//

import Foundation

class GetPostListFromLocalInteractor: OutputInteractor<GetPostListFromLocalInteractor.Output> {
    
    typealias Output = PostListModel
    
    private let localDataManager: PersistentDataManager
    
    init(localDataManager: PersistentDataManager) {
        self.localDataManager = localDataManager
        super.init()
    }
    
    override func execute() async throws -> Output {
        let postsList = localDataManager.getPosts()
        return postsList
    }
    
}
