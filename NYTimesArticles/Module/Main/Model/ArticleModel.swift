//
//  ArticleModel.swift
//  NYTimesArticles
//
//  Created by Tayseer Anwar on 12/31/21.
//

import Foundation

// MARK: - ResponseMOdel
struct ArticleResponse: Codable {
    let status, copyright: String?
    let numResults: Int?
    let articles: [Article]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case articles = "results"
    }
}

// MARK: - Result
struct Article: Codable {
    let source, publishedDate, section, subsection: String?
    let byline, type, title, abstract: String?
    let media: [Media]?

    enum CodingKeys: String, CodingKey {
        case source
        case publishedDate = "published_date"
        case section, subsection
        case byline, type, title, abstract
        case media
    }
}


// MARK: - Media
struct Media: Codable {
    let type, caption, copyright: String?
    let mediaMetadata: [MediaMetadatum]?

    enum CodingKeys: String, CodingKey {
        case type, caption, copyright
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String?
    let format: String?
    let height, width: Int?
    
    enum CodingKeys: String, CodingKey {
        case url, format, height, width
}
}
