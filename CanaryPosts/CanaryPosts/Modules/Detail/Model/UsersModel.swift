//
//  UsersModel.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import Foundation

// MARK: - UsersModelElement
struct UsersModelElement: Codable {
    let id: Int?
    let name, username, email: String?
}

typealias UsersModel = [UsersModelElement]
