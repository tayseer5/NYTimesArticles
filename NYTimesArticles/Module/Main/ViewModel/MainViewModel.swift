//
//  MainViewModel.swift
//  NYTimesArticles
//
//  Created by Tayseer Anwar on 1/1/22.
//

import Foundation
import UIKit
protocol viewBindDelegate {
    func pushToView(viewController: UIViewController)
}

/// view model for main screen will hides all asynchronous networking code, data preparation code for visual presentation, and code listening for Model changes.  
/// once view model receive response and prepare data it will notify view throught binding 
class  MainViewModel: NSObject {
    // MARK: Varibles
    //this is object from networkManager
    private var apiService: NetworkManager?
    // this is the result of bind view with viewModel it's confirmation for viewBindDelegate Protocol
    private var viewBindDelegate: viewBindDelegate?
    // this is object of response model of api call for most popular article
    // when object is init from api respponse the bind between ViewModel and View will done by calling callback function of bind which implemnted in view
    private(set) var articlesArray : [Article]? {
            didSet {
                if let bind = self.bindMainViewModelToController {
                    viewBindDelegate = bind()
                }
            }
        }
    // this varible will be implemented in the view and this is the bind between viewModel and view
    var bindMainViewModelToController : (() -> (viewBindDelegate?))?
    
    // MARK: Init Function
    override init() {
        super.init()
        self.apiService = NetworkManager()
        getMostPopularArticle()
       
    }
    // MARK: Helping Functions
    // Api Call for article list
    func getMostPopularArticle() {
        self.apiService?.getMostPopularNYArticles(period: 1) { result in
            switch result {
                    case .success(let response):
                        self.articlesArray = response.articles
                    case .failure(let error):
                        self.articlesArray = []
                        print(error.localizedDescription)
                    }
           
    }
    }
}
// MARK: View Event Notifer
extension MainViewModel{
    func selectArticle (at index: Int)  {
        if let articles = articlesArray , articles.count > index {
            let articleDetailsViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ArticleDetailsViewController") as? ArticleDetailsViewController
            let articleDetailsViewModel: ArticleDetailsViewModel = ArticleDetailsViewModel(article:articles[index])
            articleDetailsViewController?.articleDetailsViewModel = articleDetailsViewModel
            self.viewBindDelegate?.pushToView(viewController: articleDetailsViewController ?? UIViewController())
            
        }
    }
    
}
