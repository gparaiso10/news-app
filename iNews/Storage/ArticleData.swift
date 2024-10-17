//
//  ArticleData.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 17/10/2024.
//

import Foundation
import SwiftData

@Model
class ArticleModel {
    @Attribute(.unique) var id: UUID
    var source: String
    var author: String
    var title: String
    var articleDescription: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String
    
    init(id: UUID = UUID(), source: String = "", author: String = "", title: String = "", articleDescription: String = "", url: String = "", urlToImage: String = "", publishedAt: String = "", content: String = "") {
        self.id = id
        self.source = source
        self.author = author
        self.title = title
        self.articleDescription = articleDescription
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
//    convenience init(_ article: ArticleModel) {
//        self.init(id: article.id, source: article.source, author: article.author, title: article.title, articleDescription: article.description, url: article.url, urlToImage: article.urlToImage, publishedAt: article.publishedAt, content: article.content)
//    }
}
