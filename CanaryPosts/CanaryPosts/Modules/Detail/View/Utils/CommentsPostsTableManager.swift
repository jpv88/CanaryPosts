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
    
    private var dataSource: CommentsModel?
    var delegate: CommentsPostsActions?
    
    func set(input: CommentsModel) {
        dataSource = input
        delegate?.updateUI()
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentsPostsTableViewCell.getIdentifier(), for: indexPath) as? CommentsPostsTableViewCell else {
            return UITableViewCell()
        }
        guard let dataSource = dataSource, let name = dataSource[indexPath.row].name, let email = dataSource[indexPath.row].email, let body = dataSource[indexPath.row].body else {
            return UITableViewCell()
        }
        cell.fill(name: name, email: email, body: body)
        return cell
    }

}

