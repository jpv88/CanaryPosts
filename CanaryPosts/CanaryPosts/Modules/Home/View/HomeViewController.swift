//
//  HomeViewController.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import UIKit

@objc protocol HomeViewController where Self: UIViewController {
    func showLoadedInfo(input: PostListModel)
    func showThisError(error: Error)
}
