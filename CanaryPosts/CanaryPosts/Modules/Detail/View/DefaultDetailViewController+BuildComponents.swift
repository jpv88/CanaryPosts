//
//  DefaultDetailViewController+BuildComponents.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import UIKit

internal extension DefaultDetailViewController {
    
    func buildView() {
        title = Constant.title
        view.accessibilityIdentifier = Constant.accessibilityIdentifier
        buildTableViewComponent()
    }
    
    func buildTableViewComponent() {
        let component = UITableView()
        component.backgroundColor = .clear
        component.bounces = false
        component.separatorStyle = .singleLine
        component.separatorColor = Colors.tertiary
        component.delegate = tableManager
        component.dataSource = tableManager
        component.register(UINib(nibName: CommentsPostsTableViewCell.getIdentifier(), bundle: nil), forCellReuseIdentifier: CommentsPostsTableViewCell.getIdentifier())
        tableView = component
    }
    
}
