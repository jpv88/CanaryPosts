//
//  HomeViewModel.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import Foundation

protocol HomeViewModel {
    func onViewDidLoad()
    func somePostPressed(post: PostListModelElement)
}
