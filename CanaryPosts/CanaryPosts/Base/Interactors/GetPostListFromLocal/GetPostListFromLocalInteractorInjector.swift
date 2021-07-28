//
//  GetPostListFromLocalInteractorInjector.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 28/7/21.
//

import Foundation

internal extension Injector {
    
    func registerGetPostListFromLocalInteractorInjector() {
        injector.register(GetPostListFromLocalInteractor.self) { r in
            guard let localDataManager = r.resolve(PersistentDataManager.self, name: Constants.CoreData.postDataBase) else {
                fatalError("Invalid args!")
            }
            return GetPostListFromLocalInteractor(
                localDataManager: localDataManager
            )
        }
    }
}
