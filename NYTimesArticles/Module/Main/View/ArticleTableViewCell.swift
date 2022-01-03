//
//  ArticleTableViewCell.swift
//  NYTimesArticles
//
//  Created by Tayseer Anwar on 1/2/22.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var artcileData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bindData(_ articleModel: Article) {
        if articleModel.media?.count ?? 0 > 0 ,  articleModel.media?[0].mediaMetadata?.count ?? 0 > 0{
            let url = URL(string: articleModel.media?[0].mediaMetadata?[0].url ?? "")
            articleImageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "NYTIcon"),
                options: [
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
        }
        artcileData.text = articleModel.title ?? ""
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
