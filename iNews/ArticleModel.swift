//
//  ArticleModel.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import Foundation

struct ArticleModel: Identifiable, Equatable, Hashable {
    let id = UUID()
    let source: String
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}

extension ArticleModel {
    init(_ article: Article) {
        self.init(source: article.source.name,
                  author: article.author,
                  title: article.title,
                  description: article.description,
                  url: article.url,
                  urlToImage: article.urlToImage,
                  publishedAt: article.publishedAt,
                  content: article.content)
    }
}
