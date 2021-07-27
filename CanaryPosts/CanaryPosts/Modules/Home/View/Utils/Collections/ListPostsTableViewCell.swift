//
//  ListPostsTableViewCell.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import UIKit

class ListPostsTableViewCell: UITableViewCell {

    @IBOutlet var titleValueLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        selectionStyle = .none
        backgroundColor = .none
        titleLabel.textColor = Colors.secondary
        titleValueLabel.textColor = Colors.secondary
    }
    
    func fill(title: String) {
        titleLabel.text = "Post Title:"
        titleValueLabel.text = title
    }
    
}
