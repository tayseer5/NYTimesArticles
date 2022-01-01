//
//  NetworkManager.swift
//  NYTimesArticles
//
//  Created by Tayseer Anwar on 12/31/21.
//

import Foundation
import Moya

/// Network Manager that confirm Network Protocol , add logic of fetching data and logic of how to request data from provider for API file
class NetworkManager: Networkable {
    var provider = MoyaProvider<ArticleAPI>(plugins: [NetworkLoggerPlugin()])

    func getMostPopularNYArticles(period: Int, completion: @escaping (Result<ArticleResponse, Error>) -> ()) {
        request(target: .mostPopularArticle(period: period), completion: completion)
    }
}

private extension NetworkManager {
    //generic request method to prevents code dublication and used Result as return type to make it generic and able to know the case of response from enum if it success with response or fail with error
    private func request<T: Decodable>(target: ArticleAPI, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
