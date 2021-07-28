//
//  ListPostsInteractorInjector.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import Foundation

internal extension Injector {
    
    func registerListPostsInteractorInjector() {
        injector.register(ListPostsInteractor.self) { r in
            guard let webService: WebService = r.resolve(WebService.self) else {
                fatalError("Invalid args!")
            }
            guard let localDataManager = r.resolve(PersistentDataManager.self, name: Constants.CoreData.postDataBase) else {
                fatalError("Invalid args!")
            }
            return ListPostsInteractor(
                webService: webService,
                localDataManager: localDataManager
            )
        }
    }
}
