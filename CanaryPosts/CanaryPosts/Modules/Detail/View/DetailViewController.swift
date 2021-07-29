//
//  DetailViewController.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import UIKit

@objc protocol DetailViewController where Self: UIViewController {
    func showPostInfo(title: String, body: String)
    func showOwnerInfo(name: String)
    func showComments(input: CommentsModel)
    func showThisError(error: Error)
}
