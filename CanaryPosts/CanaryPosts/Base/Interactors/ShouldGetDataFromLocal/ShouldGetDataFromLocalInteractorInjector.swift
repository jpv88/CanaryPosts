//
//  ShouldGetDataFromLocalInteractorInjector.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 28/7/21.
//

import Foundation

internal extension Injector {
    
    func registerShouldGetDataFromLocalInteractorInjector() {
        injector.register(ShouldGetDataFromLocalInteractor.self) { r in
            guard let localDataManager = r.resolve(PersistentDataManager.self, name: Constants.CoreData.postDataBase) else {
                fatalError("Invalid args!")
            }
            return ShouldGetDataFromLocalInteractor(
                localDataManager: localDataManager
            )
        }
    }
}
