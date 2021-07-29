//
//  DefaultDetailViewModel.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import Foundation

class DefaultDetailViewModel: DetailViewModel {
    
    private weak var view: DetailViewController?
    private let post: PostListModelElement
    
    init(view: DetailViewController, post: PostListModelElement) {
        self.view = view
        self.post = post
    }
    
    func onViewDidLoad() {
        
    }
    
}
