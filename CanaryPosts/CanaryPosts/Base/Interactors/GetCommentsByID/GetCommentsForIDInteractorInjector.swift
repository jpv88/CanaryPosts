//
//  GetCommentsByIDInteractorInjector.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import Foundation

internal extension Injector {
    
    func registerGetCommentsByIDInteractor() {
        injector.register(GetCommentsByIDInteractor.self) { r in
            guard let webService: WebService = r.resolve(WebService.self) else {
                fatalError("Invalid args!")
            }
            guard let localDataManager = r.resolve(PersistentDataManager.self, name: Constants.CoreData.postDataBase) else {
                fatalError("Invalid args!")
            }
            return GetCommentsByIDInteractor(
                webService: webService,
                localDataManager: localDataManager
            )
        }
    }
}
