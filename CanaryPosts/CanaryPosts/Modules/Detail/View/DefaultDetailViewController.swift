//
//  DefaultDetailViewController.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import UIKit

class DefaultDetailViewController: BaseViewController {
    
    internal var tableView: UITableView!
    var viewModel: DetailViewModel?
    var tableManager: CommentsPostsTableManager?
    
    internal enum Constant {
        static let title = "Canary Post Detail"
        static let accessibilityIdentifier = "DetailView"
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
extension DefaultDetailViewController: DetailViewController {
    
    func showThisError(error: Error) {
        showError(error: error)
    }
        
    func showLoadedInfo(input: String) {
        tableManager?.set(input: input)
    }
        
}

// MARK: ListPostsActions Protocol
extension DefaultDetailViewController: CommentsPostsActions {    
    
    func updateUI() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}
