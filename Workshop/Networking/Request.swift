//
//  Request.swift
//  Workshop
//
//  Created by Анна on 13.11.2024.
//

import Foundation

struct Request {
    enum Method: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
        case patch = "PATCH"
        case options = "OPTIONS"
    }
    
    var endpoint: Endpoint
    var method: Method
    var parameters: [String: String]?
    var timeout: TimeInterval
    
    let body: Data?
    
    init(
        endpoint: Endpoint,
        method: Method = .get,
        parameters: [String: String]? = nil,
        timeout: TimeInterval = 60,
        body: Data? = nil
    ) {
        self.endpoint = endpoint
        self.method = method
        self.parameters = parameters
        self.timeout = timeout
        self.body = body
        
        if var endpointParameters = endpoint.parameters {
            for (key, value) in parameters ?? [:] {
                endpointParameters[key] = value
            }
            
            self.parameters = endpointParameters
        }
    }
}
