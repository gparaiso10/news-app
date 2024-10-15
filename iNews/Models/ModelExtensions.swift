//
//  Extensions.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 10/10/2024.
//

extension ArticleModel {
    init(_ article: Article) {
        self.init(source: article.source.name ?? "",
                  author: article.author ?? "",
                  title: article.title ?? "",
                  description: article.description ?? "",
                  url: article.url ?? "",
                  urlToImage: article.urlToImage ?? "",
                  publishedAt: article.publishedAt ?? "",
                  content: article.content ?? "")
    }
}

extension ArticleModel {
    static func mockArticle() -> ArticleModel {
        ArticleModel(
            source: "Tech News Daily",
            author: "Regina Wilkins",
            title: "Why And How To Delete Your Data From Online Platforms",
            description: "A groundbreaking AI technology is set to revolutionize industries from healthcare to finance.",
            url: "https://technewsdaily.com/news/why-and-how-to-delete-your-data-from-online-platforms/",
            urlToImage: "https://technewsdaily.com/wp-content/uploads/2024/02/The-Basics-Of-Metaverse-350x250.jpg",
            publishedAt: "2024-10-10T10:30:00Z",
            content: "In today’s digital age, our lives are increasingly intertwined with online platforms. From social media networks to e-commerce websites, we willingly share vast amounts of personal data every day. While these platforms offer convenience and connectivity, they also pose significant risks to our privacy and security. As awareness grows about the importance of protecting personal data, many individuals are considering the option of deleting their data from online platforms. In this blog post, we’ll explore why this is important and provide practical guidance on how to do it effectively."
        )
    }
    
    static func mockArray() -> [ArticleModel] {
        return [
            ArticleModel.mockArticle(),
            ArticleModel(
                source: "Tech News Daily",
                author: "Regina Wilkins",
                title: "Why Does My Dell Laptop Keep Shutting Down? The Ultimate Guide",
                description: "Understanding the root causes of these shutdowns—whether they stem from hardware malfunctions, software conflicts, or external factors—is crucial for implementing effective solutions.",
                url: "https://technewsdaily.com/news/computer/why-does-my-dell-laptop-keep-shutting-down/",
                urlToImage: "https://technewsdaily.com/wp-content/uploads/2024/02/Why-Does-My-Dell-Laptop-Keep-Shutting-Down-750x500.jpg",
                publishedAt: "2024-10-10T10:30:00Z",
                content: "Seeking professional help for your Dell laptop’s unexpected shutdowns is important when basic and advanced troubleshooting steps fail to resolve the issue or when the problem requires expertise beyond your comfort level. Here are scenarios indicating it’s time to consult a professional:"
            ),
            ArticleModel(
                source: "BBC News",
                author: "Helen Willets",
                title: "Four killed by tornadoes in Florida, as DeSantis warns of more Hurricane Milton flooding",
                description: "Understanding the root causes of these shutdowns—whether they stem from hardware malfunctions, software conflicts, or external factors—is crucial for implementing effective solutions.",
                url: "https://www.bbc.com/news/live/cglkd1l82g7t",
                urlToImage: "https://ichef.bbci.co.uk/ace/standard/692/cpsprodpb/vivo/live/images/2024/10/10/90311e0d-12e6-4a09-bfd7-b724c31d43f6.jpg.webp",
                publishedAt: "2024-10-10T10:30:00Z",
                content: "Now that Hurricane Milton has moved offshore, the risk of severe thunderstorms and tornadoes in Florida has diminished. However, the risk of flash flooding and damaging winds remains. Due to high tides, rivers filling up, and the sheer volume of rain that has fallen, major urban flooding is still likely - especially as there is yet more rain to come in central and northern Florida. High speed winds - hurricane force in places - are also still battering the east of Florida. They could bring a risk of life-threatening storm surges from east-central Florida right up to Georgia and, to a lesser degree, South Carolina. The storm may also pass close by to Bermuda. However, the proximity of this storm to Bermuda and the US east coast over the next few days will cause large swells and dangerous rip currents."
            )
        ]
    }
}


extension Article {
    func toModel() -> ArticleModel {
        ArticleModel(self)
    }
}

extension Array where Element == Article {
    func toModel() -> [ArticleModel] {
        self.map { ArticleModel($0)}
    }
}
