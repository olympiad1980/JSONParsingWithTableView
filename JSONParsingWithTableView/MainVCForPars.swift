import UIKit

class MainVCForPars: UIViewController {
    static let cellIdentifier = "MainVCCell"
    
    let news: [News]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsModel().fetchArctices()
    }
}

extension MainVCForPars: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let news = news else {
            return 0
        }
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainVCForPars.cellIdentifier, for: indexPath) as! ArticleCell
        
        if let newsIndexPathForRow = news?[indexPath.row] {
            cell.setupCell = newsIndexPathForRow
        }
        
        return cell
    }
}

extension MainVCForPars: NewsManagerDelegate {

    func didloadNews(id: News) {
    }
}
