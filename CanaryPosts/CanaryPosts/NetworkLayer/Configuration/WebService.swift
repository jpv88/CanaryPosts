//
//  WebService.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import Foundation

enum MyCustomError: Error {
    case NoParsedModel(String)
    case ApiError(String)
}

class WebService: NSObject, URLSessionTaskDelegate {
    
    private let decoder = JSONDecoder()
    
    override init() {
        decoder.dateDecodingStrategy = .deferredToDate
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
        
    func load<T>(type: T.Type, endpoint: Endpoint) async throws -> T where T: Decodable {
        
        let myRequest = endpoint.getRequest
        
        guard let url = URL(string: myRequest.path) else {
            throw MyCustomError.ApiError("Bad usage")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = myRequest.method.rawValue
        
        let request = try await URLSession.shared.data(for: urlRequest, delegate: self)
        guard let httpResponse = request.1 as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MyCustomError.ApiError("API is down")
        }
        let data = request.0
        guard let object = try? decoder.decode(T.self, from: data) else {
            throw MyCustomError.NoParsedModel("Model could not be parsed")
        }
        
        return object
    }
  
}
