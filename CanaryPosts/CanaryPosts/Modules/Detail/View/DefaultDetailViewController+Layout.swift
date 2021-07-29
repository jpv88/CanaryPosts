//
//  DefaultDetailViewController+Layout.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import UIKit

internal extension DefaultDetailViewController {
    
    func layoutView() {
        layoutPostTitle()
        layoutPostBody()
        layoutOwnerPost()
        layoutCommentsTitle()
        layoutTableView()
    }
    
    private func layoutPostTitle() {
        view.addSubview(postTitle)
        
        postTitle.translatesAutoresizingMaskIntoConstraints = false
        postTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.marginSeparator).isActive = true
        postTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.marginSeparator).isActive = true
        postTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constant.marginSeparator).isActive = true
    }
    
    private func layoutPostBody() {
        view.addSubview(postBody)
        
        postBody.translatesAutoresizingMaskIntoConstraints = false
        postBody.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: Constant.marginSeparator).isActive = true
        postBody.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.marginSeparator).isActive = true
        postBody.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constant.marginSeparator).isActive = true
    }
    
    private func layoutOwnerPost() {
        view.addSubview(ownerPost)
        
        ownerPost.translatesAutoresizingMaskIntoConstraints = false
        ownerPost.topAnchor.constraint(equalTo: postBody.bottomAnchor, constant: Constant.marginSeparator).isActive = true
        ownerPost.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.marginSeparator).isActive = true
        ownerPost.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constant.marginSeparator).isActive = true
    }
    
    private func layoutCommentsTitle() {
        view.addSubview(commentsTitle)
        
        commentsTitle.translatesAutoresizingMaskIntoConstraints = false
        commentsTitle.topAnchor.constraint(equalTo: ownerPost.bottomAnchor, constant: Constant.marginSeparator).isActive = true
        commentsTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.marginSeparator).isActive = true
        commentsTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constant.marginSeparator).isActive = true
    }
    
    private func layoutTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: commentsTitle.bottomAnchor, constant: Constant.marginSeparator).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
    }
    
}
