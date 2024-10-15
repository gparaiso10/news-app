//
//  NewsArticle.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import Foundation


struct APIResponse: Codable, Sendable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
    let code: String?
    let message: String?
}


struct Article: Codable, Sendable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

}

enum Status: String, Codable {
    case ok
    case error
}

struct Source: Codable {
    let id: String?
    let name: String?
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


