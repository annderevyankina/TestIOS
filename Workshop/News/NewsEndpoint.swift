//
//  NewsEndpoint.swift
//  Workshop
//
//  Created by Анна on 13.11.2024.
//

import Foundation

enum NewsEndpoint: Endpoint {
    case news(newsId: String, pageIndex: String)
    
    var compositePath: String {
        return "/api/Section"
    }
    
    var headers: [String : String] {
        [:]
    }
    
    var parameters: [String: String]? {
        switch self {
        case .news(let rubricId, let pageIndex):
            return [
                "pageIndex": pageIndex,
                "rubricId": rubricId
            ]
        }
    }
}
// https://news.myseldon.com/api/Section?rubricId=4&pageSize=8&pageIndex=1
