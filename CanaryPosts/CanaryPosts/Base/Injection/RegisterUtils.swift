//
//  RegisterUtils.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

internal extension Injector {
    
    func registerUtils() {
        registerWebService()
        registerListPostTableManager()
    }
    
    private func registerWebService() {
        injector.register(WebService.self) { _ in
            WebService()
        }
    }
    
    private func registerListPostTableManager() {
        injector.register(ListPostsTableManager.self) { _ in
            ListPostsTableManager()
        }
    }
     
    
}
