//
//  GetUsersInfo.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 29/7/21.
//

import Foundation

struct GetUsersInfo: Requestable {
    
    var method: HTTPMethod = .get
    var path: String
    var parameters: [String : String]? = nil
    private let endpointPath = "users"
    
    init() {
        let baseURL = "\(Constants.API.host)/\(endpointPath)"
        let urlComps = URLComponents(string: baseURL)
        path = urlComps?.url?.absoluteString ?? ""
    }
        
}
