//
//  DefaultDetailViewController.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import UIKit

class DefaultDetailViewController: BaseViewController {
        
    internal var postTitle: UILabel!
    internal var postBody: UILabel!
    internal var ownerPost: UILabel!
    internal var commentsTitle: UILabel!
    internal var tableView: UITableView!
    var viewModel: DetailViewModel?
    var tableManager: CommentsPostsTableManager?
    
    internal enum Constant {
        static let title = "Canary Post Detail"
        static let accessibilityIdentifier = "DetailView"
        static let commentsLabel = "Comments on Post:"
        static let postOwnerTitle = "Post Owner:"
        static let marginSeparator: CGFloat = 16
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
    
    func showPostInfo(title: String, body: String) {
        DispatchQueue.main.async { [weak self] in
            self?.postTitle.text = title
            self?.postBody.text = body
        }
    }
    
    func showOwnerInfo(name: String) {
        DispatchQueue.main.async { [weak self] in
            self?.ownerPost.text = "\(Constant.postOwnerTitle) \(name)"
        }
    }
    
    func showComments() {
        tableManager?.set(input: "")
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
