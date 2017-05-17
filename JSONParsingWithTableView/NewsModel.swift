import SwiftyJSON

protocol NewsManagerDelegate {
    func didloadNews(id: News)
}

struct News {
    
    var title: String
    var desc: String
    var author: String
    var url: String
    var imageUrl: String
    
}

class NewsModel {
    
    private var arcticesArray: [News] = []
    private let delegate: NewsManagerDelegate? = nil
    
    func fetchArctices() {
        
        let url = URL.init(string: "https://newsapi.org/v1/articles?source=al-jazeera-english&sortBy=top&apiKey=4f3ad7637a534b788fcba09428886b62")!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data else {
                print("data was nil?")
                return
            }
            
            let json = JSON.init(data: data)
            let jsonArray = json["articles"].arrayValue
            for item in jsonArray {
                let title = item["title"].stringValue
                let desc = item["description"].stringValue
                let author = item["author"].stringValue
                let url = item["url"].stringValue
                let urlToImage = item["urlToImage"].stringValue
                
                let arctices = News(title: title, desc: desc, author: author, url: url, imageUrl: urlToImage)
                if let delegate = self.delegate {
                    delegate.didloadNews(id: arctices)
                }
            }

        }.resume()
    }
}
