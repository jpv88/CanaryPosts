//
//  CommentsPostsTableManager.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import UIKit

protocol CommentsPostsActions {
    func updateUI()
}

class CommentsPostsTableManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var dataSource: String?
    var delegate: CommentsPostsActions?
    
    func set(input: String) {
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentsPostsTableViewCell.getIdentifier(), for: indexPath) as? CommentsPostsTableViewCell else {
            return UITableViewCell()
        }
//        guard let dataSource = dataSource, let title = dataSource[indexPath.row].title else {
//            return UITableViewCell()
//        }
//        cell.fill(title: title)
        return cell
    }

}

