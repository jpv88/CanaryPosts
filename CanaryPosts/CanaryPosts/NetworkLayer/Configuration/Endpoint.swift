//
//  Endpoint.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import Foundation

struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    static let connect = HTTPMethod(rawValue: "CONNECT")
    static let delete = HTTPMethod(rawValue: "DELETE")
    static let get = HTTPMethod(rawValue: "GET")
    static let head = HTTPMethod(rawValue: "HEAD")
    static let options = HTTPMethod(rawValue: "OPTIONS")
    static let patch = HTTPMethod(rawValue: "PATCH")
    static let post = HTTPMethod(rawValue: "POST")
    static let put = HTTPMethod(rawValue: "PUT")
    static let trace = HTTPMethod(rawValue: "TRACE")

    let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

enum Endpoint {
    case ListPosts
}

protocol Requestable {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: String]? { get }
}

extension Endpoint {
    var getRequest: Requestable {
        switch self {
        case .ListPosts:
            return GetListPosts()
        }
    }
}
