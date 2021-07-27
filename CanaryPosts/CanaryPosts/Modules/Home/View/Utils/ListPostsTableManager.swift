//
//  ListPostsTableManager.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import UIKit

protocol ListPostsActions {
    func somePostPressed(postID: String)
    func updateUI()
}

class ListPostsTableManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var dataSource: PostListModel?
    var delegate: ListPostsActions?
    
    func set(input: PostListModel) {
        dataSource = input
        delegate?.updateUI()
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListPostsTableViewCell.getIdentifier(), for: indexPath) as? ListPostsTableViewCell else {
            return UITableViewCell()
        }
        guard let dataSource = dataSource, let title = dataSource[indexPath.row].title else {
            return UITableViewCell()
        }
        cell.fill(title: title)
        return cell
    }
    
}
