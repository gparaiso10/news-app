//
//  Article.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 15/10/2024.
//

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
