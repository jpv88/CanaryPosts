//
//  DefaultHomeViewController.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import UIKit

class DefaultHomeViewController: BaseViewController {
    
    internal var tableView: UITableView!
//    var viewModel: HomeViewModel?
    var tableManager: ListPostsTableManager?
    
    internal enum Constant {
        static let title = "Canary TV"
        static let accessibilityIdentifier = "HomeView"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
