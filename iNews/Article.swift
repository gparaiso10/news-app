//
//  NewsArticle.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import Foundation

struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String

}

struct APIResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
    let code: String?
    let message: String?
}

enum Status: String, Codable {
    case ok
    case error
}

struct Source: Codable {
    let id: String?
    let name: String
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


