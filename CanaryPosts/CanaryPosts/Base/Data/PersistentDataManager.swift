//
//  PersistentDataManager.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 28/7/21.
//

import Foundation

protocol PersistentDataManager {
    func savePost(id: Int, userId: Int, title: String, body: String)
}