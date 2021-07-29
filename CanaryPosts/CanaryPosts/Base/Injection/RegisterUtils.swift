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
        registerPersistentDataManager()
        registerCommentsPostTableManager()
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
    
    private func registerPersistentDataManager() {
        injector.register(PersistentDataManager.self, name: Constants.CoreData.postDataBase) { _ in
            DefaultPersistentDataManager(dataBaseName: Constants.CoreData.postDataBase)
        }
    }
     
    private func registerCommentsPostTableManager() {
        injector.register(CommentsPostsTableManager.self) { _ in
            CommentsPostsTableManager()
        }
    }
    
}
