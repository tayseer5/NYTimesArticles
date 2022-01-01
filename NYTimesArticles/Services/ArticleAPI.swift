//
//  ArticleAPI.swift
//  NYTimesArticles
//
//  Created by Tayseer Anwar on 12/30/21.
//

import Foundation
import Moya


//enums for apis used in app
enum ArticleAPI {
    case mostPopularArticle(period:Int)
}

// This is the variables used to create the api request
extension ArticleAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Constant.baseURL) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .mostPopularArticle(let period):
            return Constant.mostPopular + "/\(period)" + ".json"
        }
    }
    
    var method: Moya.Method {
            return .get
    }
    
    var sampleData: Data {
            return Data()
    }
    
    var task: Task {
        switch self {
        case .mostPopularArticle:
            return .requestParameters(parameters: ["api-key": Constant.apiKey], encoding: URLEncoding.queryString)
            }
    }
    var headers: [String : String]? {
            return nil
        }
    
}
