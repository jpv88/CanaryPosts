//
//  UIViewController+ActivityIndicator.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import UIKit

extension UIViewController {
    @objc func showLoader() {
        DispatchQueue.main.async {
            let activity = UIActivityIndicatorView()
            let backgroundAlphaView = UIView(frame: self.view.bounds)
            backgroundAlphaView.tag = 789
            backgroundAlphaView.backgroundColor = .clear
            self.view.addSubview(backgroundAlphaView)
            backgroundAlphaView.translatesAutoresizingMaskIntoConstraints = false
            backgroundAlphaView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            backgroundAlphaView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            backgroundAlphaView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            backgroundAlphaView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            backgroundAlphaView.addSubview(activity)
            activity.translatesAutoresizingMaskIntoConstraints = false
            activity.centerXAnchor.constraint(equalTo: backgroundAlphaView.centerXAnchor).isActive = true
            activity.centerYAnchor.constraint(equalTo: backgroundAlphaView.centerYAnchor).isActive = true
            activity.style = .large
            activity.color = UIColor.blue
            activity.hidesWhenStopped = true
            activity.isHidden = false
            activity.startAnimating()
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            if let activity = self.view.viewWithTag(789) {
                activity.removeFromSuperview()
            }
        }
    }
}
