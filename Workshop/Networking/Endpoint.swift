//
//  Endpoint.swift
//  Workshop
//
//  Created by Анна on 13.11.2024.
//

protocol Endpoint {
    var compositePath: String { get }
    var headers: [String: String] { get }
    var parameters: [String: String]? { get }
}

extension Endpoint {
    var parameters: [String: String]? {
        nil
    }
}
