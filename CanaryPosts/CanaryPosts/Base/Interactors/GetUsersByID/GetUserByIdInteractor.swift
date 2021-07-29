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
            if try await shouldGetDataFromLocal() {
                let usersList = localDataManager.getUsers()
                return try await getUserWithId(userList: usersList, id: input)
            } else {
                let usersList = try await webService.load(type: UsersModel.self, endpoint: .UsersInfo)
                try await saveDataInLocal(input: usersList)
                return try await getUserWithId(userList: usersList, id: input)
            }
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
    
    private func saveDataInLocal(input: UsersModel) async throws {
        input.forEach { element in
            if let id = element.id, let exactlyID = Int(exactly: id), let name = element.name, let username = element.username, let email = element.email {
                localDataManager.saveUser(id: exactlyID, name: name, username: username, email: email)
            }
        }
    }
    
    private func shouldGetDataFromLocal() async throws -> Bool {
        let usersList = localDataManager.getUsers()
        return !usersList.isEmpty
    }
    
}
