//
//  DefaultHomeViewController+BuildComponents.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import UIKit

internal extension DefaultHomeViewController {
    
    func buildView() {
        title = Constant.title
        view.accessibilityIdentifier = Constant.accessibilityIdentifier
    }
    
}
