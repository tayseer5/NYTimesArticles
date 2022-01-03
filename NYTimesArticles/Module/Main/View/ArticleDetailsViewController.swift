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
        titleLabel.text = articleDetailsViewModel?.article.title
        sourceLabel.text = articleDetailsViewModel?.article.source
        publishDateLabel.text = articleDetailsViewModel?.article.publishedDate
        sectionLabel.text = articleDetailsViewModel?.article.section
        detailsLabel.text = articleDetailsViewModel?.article.abstract
    }
}
