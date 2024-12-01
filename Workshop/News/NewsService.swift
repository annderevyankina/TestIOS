//
//  NewsService.swift
//  Workshop
//
//  Created by Анна on 13.11.2024.
//

import Foundation

final class NewsService {
    let worker = BaseURLNetworking(baseURL: "https://news.myseldon.com")
    let decoder = JSONDecoder()
    
    func fetchNews(
        rubricId: Int,
        pageId: Int,
        completion: ((Result<SeldonNews?, Error>) -> Void)?
    ) {
        let endpoint = NewsEndpoint.news(newsId: "\(rubricId)", pageIndex: "\(pageId)")
        
        fetch(request: Request(endpoint: endpoint, timeout: 60), completion: completion)
    }
    
    private func fetch<T: Decodable>(
        request: Request,
        completion: ((Result<T?, Error>) -> Void)?
    ) {
        worker.execute(request: request) { [weak self] response in
            switch response {
            case .success(let serverResponse):
                guard
                    let self,
                    let data = serverResponse.data
                else {
                    // Idealy we create custom error enum
                    completion?(.success(nil))
                    return
                }
                
                do {
                    let decoded = try self.decoder.decode(T.self, from: data)
                    completion?(.success(decoded))
                } catch(let error) {
                    completion?(.failure(error))
                }
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}
