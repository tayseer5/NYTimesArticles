//
//  ArticleDetailsViewModel.swift
//  NYTimesArticles
//
//  Created by Tayseer Anwar on 1/2/22.
//

import Foundation
class  ArticleDetailsViewModel: NSObject {
    // MARK: Varibles
    var article :Article
    init(article: Article) {
            self.article = article
            super.init()
    }
    
}
