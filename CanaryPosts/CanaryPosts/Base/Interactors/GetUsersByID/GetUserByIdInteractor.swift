//
//  GetUserByIdInteractor.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import Foundation

class GetUserByIdInteractor: InOutInteractor<GetUserByIdInteractor.Input, GetUserByIdInteractor.Output> {
    
    typealias Input = Int
    typealias Output = UsersModelElement
    
    private let webService: WebService
    private let localDataManager: PersistentDataManager
    
    init(webService: WebService, localDataManager: PersistentDataManager) {
        self.webService = webService
        self.localDataManager = localDataManager
        super.init()
    }
    
    override func execute(input: Input) async throws -> Output {
        do {
            let usersList = try await webService.load(type: UsersModel.self, endpoint: .UsersInfo)
//            try await saveDataInLocal(input: postsList)
            return try await getUserWithId(userList: usersList, id: input)
        } catch {
            throw MyCustomError.ApiError("Api Error")
        }
    }
    
    private func getUserWithId(userList: UsersModel, id: Int) async throws -> Output {
        if let result = userList.first(where: {$0.id == id}) {
            return result
        } else {
            throw MyCustomError.InternalError("No founded elements!")
        }
    }
//    private func saveDataInLocal(input: PostListModel) async throws {
//        input.forEach { element in
//            if let id = element.id, let exactlyID = Int(exactly: id), let userId = element.userId, let exactlyUserId = Int(exactly: userId), let title = element.title, let body = element.body {
//                localDataManager.savePost(id: exactlyID, userId: exactlyUserId, title: title, body: body)
//            }
//        }
//    }
    
}
