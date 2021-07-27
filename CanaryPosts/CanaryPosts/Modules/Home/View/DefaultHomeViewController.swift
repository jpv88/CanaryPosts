//
//  DefaultHomeViewController.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import UIKit

class DefaultHomeViewController: BaseViewController {
    
    internal var tableView: UITableView!
    var viewModel: HomeViewModel?
    var tableManager: ListPostsTableManager?
    
    internal enum Constant {
        static let title = "Canary Posts"
        static let accessibilityIdentifier = "HomeView"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewDidLoad()
    }
    
    override func buildComponents() {
        super.buildComponents()
        buildView()
    }
    
    override func setUpLayout() {
        super.setUpLayout()
        layoutView()
    }

}

// MARK: HomeViewController Protocol
extension DefaultHomeViewController: HomeViewController {
    
    func showThisError(error: Error) {
        showError(error: error)
    }
        
    func showLoadedInfo(input: PostListModel) {
        tableManager?.set(input: input)
    }
        
}

// MARK: ListPostsActions Protocol
extension DefaultHomeViewController: ListPostsActions {
    
    func somePostPressed(post: PostListModelElement) {
        viewModel?.somePostPressed(post: post)
    }
    
    func updateUI() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}
