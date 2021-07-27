//
//  UITableViewCell+Identifier.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import UIKit

extension UITableViewCell {
    static func getIdentifier() -> String {
        return String(describing: self)
    }
}
