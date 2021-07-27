//
//  GetListPosts.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import Foundation

struct GetListPosts: Requestable {
    
    var method: HTTPMethod = .get
    var path: String
    var parameters: [String : String]? = nil
    private let endpointPath = "posts"
    
    init() {
        let baseURL = "\(Constants.API.host)/\(endpointPath)"
        let urlComps = URLComponents(string: baseURL)
        path = urlComps?.url?.absoluteString ?? ""
    }
    
    
}
