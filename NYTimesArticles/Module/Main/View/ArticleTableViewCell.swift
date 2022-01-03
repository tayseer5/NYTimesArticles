//
//  ArticleTableViewCell.swift
//  NYTimesArticles
//
//  Created by Tayseer Anwar on 1/2/22.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var artcileData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bindData(_ articleModel: Article) {
        
        artcileData.text = articleModel.title ?? ""
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
