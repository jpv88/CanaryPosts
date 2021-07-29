//
//  HomeCoordinator.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import Foundation

protocol HomeCoordinator: CoordinatorBase {
    func showDetailView(selectedPost: PostListModelElement)
}
