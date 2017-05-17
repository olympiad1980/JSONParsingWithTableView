
import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var urlImage: UIImageView!

    var setupCell: News? {
        didSet {
            initArticle()
        }
    }
}

fileprivate extension ArticleCell {
    
    func initArticle() {
        if let setupCell = setupCell {
            titleLabel.text = setupCell.title
            descLabel.text = setupCell.desc
            author.text = setupCell.author
            urlImage.image = UIImage.init(named: "photoalbum")
        }
    }
}
