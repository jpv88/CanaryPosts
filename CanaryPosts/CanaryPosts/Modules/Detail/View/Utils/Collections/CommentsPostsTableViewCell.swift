//
//  CommentsPostsTableViewCell.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import UIKit

class CommentsPostsTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nameValueLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var emailValueLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    @IBOutlet var bodyValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    private func setup() {
        selectionStyle = .none
        backgroundColor = .none
        nameLabel.textColor = Colors.yellow
        nameValueLabel.textColor = Colors.secondary
        emailLabel.textColor = Colors.yellow
        emailValueLabel.textColor = Colors.secondary
        bodyLabel.textColor = Colors.yellow
        bodyValueLabel.textColor = Colors.secondary
    }
    
    func fill(name: String, email: String, body: String) {
        nameValueLabel.text = name
        emailValueLabel.text = email
        bodyValueLabel.text = body
    }
    
}
