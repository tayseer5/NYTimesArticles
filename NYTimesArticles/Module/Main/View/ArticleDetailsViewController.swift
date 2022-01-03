//
//  ArticleDetailsViewController.swift
//  NYTimesArticles
//
//  Created by Tayseer Anwar on 1/2/22.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    // MARK: IbOutLet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    // MARK: varibles
    var articleDetailsViewModel: ArticleDetailsViewModel?
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayData()
    }
    // MARK: Helping Function
    private func displayData () {
        titleLabel.text = "Title: \(articleDetailsViewModel?.article.title ?? "UnDefine")"
        sourceLabel.text = "Source: \(articleDetailsViewModel?.article.source ?? "UnDefine")"
        publishDateLabel.text = "Date: \(articleDetailsViewModel?.article.publishedDate ?? "UnDefine" )"
        sectionLabel.text = "Section: \(articleDetailsViewModel?.article.section ?? "UnDefine")"
        detailsLabel.text = "Details:\(articleDetailsViewModel?.article.abstract ?? "UnDefine")"
        if articleDetailsViewModel?.article.media?.count ?? 0 > 0 ,  articleDetailsViewModel?.article.media?[0].mediaMetadata?.count ?? 0 > 0{
            let url = URL(string: articleDetailsViewModel?.article.media?[0].mediaMetadata?[0].url ?? "")
            articleImageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "NYTIcon"),
                options: [
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
        }
    }
}
