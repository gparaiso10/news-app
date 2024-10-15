//
//  NewsArticle.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

struct APIResponse: Codable, Sendable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
    let code: String?
    let message: String?
}


