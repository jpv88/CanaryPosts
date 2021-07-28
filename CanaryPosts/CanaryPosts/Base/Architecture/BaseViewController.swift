//
//  BaseViewController.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildComponents()
        setUpLayout()
    }
    
    func buildComponents() {
        view.backgroundColor = Colors.main
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Colors.tertiary
        appearance.titleTextAttributes = [.foregroundColor: Colors.secondary]
        appearance.largeTitleTextAttributes = [.foregroundColor: Colors.secondary]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setUpLayout() {}
    
    func showError(error: Error, firstButtonTitle: String = "OK", dismissButtonTitle: String = "Cancel", action: (()->())? = nil, dismissAction: (()->())? = nil) {
        DispatchQueue.main.sync {
            let alertView = UIAlertController()
            let firstButton = UIAlertAction(title: firstButtonTitle, style: .default) { _ in
                action?()
            }
            let dismissButton = UIAlertAction(title: dismissButtonTitle, style: .cancel) { _ in
                dismissAction?()
            }
            alertView.title = "Error"
            alertView.message = error.localizedDescription
            alertView.addAction(firstButton)
            alertView.addAction(dismissButton)
            navigationController?.present(alertView, animated: true, completion: nil)
        }
    }
    
    func showAlert(title: String, msg: String, dismissButtonTitle: String = "Cancel", action: (()->())? = nil, dismissAction: (()->())? = nil) {
        DispatchQueue.main.sync {
            let alertView = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            
            let dismissButton = UIAlertAction(title: dismissButtonTitle, style: .cancel) { _ in
                dismissAction?()
            }
            alertView.addAction(dismissButton)
            navigationController?.present(alertView, animated: true, completion: nil)
        }
    }
    
}
