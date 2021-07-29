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
        buildPostTitle()
        buildPostBody()
        buildOwnerPost()
        buildCommentsTitle()
        buildTableView()
    }
    
    private func buildPostTitle() {
        let component = UILabel()
        component.backgroundColor = .clear
        component.textColor = Colors.secondary
        component.font = UIFont.systemFont(ofSize: 12)
        component.numberOfLines = 0
        postTitle = component
    }
    
    private func buildPostBody() {
        let component = UILabel()
        component.backgroundColor = .clear
        component.textColor = Colors.secondary
        component.font = UIFont.systemFont(ofSize: 12)
        component.numberOfLines = 0
        postBody = component
    }
    
    private func buildOwnerPost() {
        let component = UILabel()
        component.backgroundColor = .clear
        component.textColor = Colors.secondary
        component.font = UIFont.systemFont(ofSize: 12)
        ownerPost = component
    }
    
    private func buildCommentsTitle() {
        let component = UILabel()
        component.backgroundColor = .clear
        component.textColor = Colors.secondary
        component.font = UIFont.systemFont(ofSize: 12)
        component.text = Constant.commentsLabel
        commentsTitle = component
    }
    
    private func buildTableView() {
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
