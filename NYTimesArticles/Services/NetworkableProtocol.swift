//
//  NetworkableProtocol.swift
//  NYTimesArticles
//
//  Created by Tayseer Anwar on 12/31/21.
//

import Foundation
import Moya

/// Network Protocol That contain Provider and Header of fetch method
protocol Networkable {
    var provider: MoyaProvider<ArticleAPI> { get }

    func getMostPopularNYArticles(period: Int, completion: @escaping (Result<ArticleResponse, Error>) -> ())
   
}
