//
//  DetailViewController.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import UIKit

@objc protocol DetailViewController where Self: UIViewController {
    func showLoadedInfo(input: String)
    func showThisError(error: Error)
}
