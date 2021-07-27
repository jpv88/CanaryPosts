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
    
    private var dataSource: String?
    var delegate: ListPostsActions?
    
    func set(input: String) {
        dataSource = input
        delegate?.updateUI()
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListMoviesTableViewCell.getIdentifier(), for: indexPath) as? ListMoviesTableViewCell else {
//            return UITableViewCell()
//        }
//        guard let dataSource = dataSource else {
//            return UITableViewCell()
//        }
//        guard let name = dataSource[indexPath.row].data?.name, let data = dataSource[indexPath.row].data?.contents?.data else {
//            return UITableViewCell()
//        }
//        cell.delegate = self
//        cell.fill(title: name, model: data)
//        return cell
    }
    
}
