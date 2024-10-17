//
//  NewsListViewModel.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import Foundation

protocol NewsAPIService: Sendable {
    func fetchNews(query: String?, sources: [String]?, domains: [String]?, excludeDomains: [String]?, from: String?, to: String?, language: Language, sortBy: SortBy, page: Int, pageSize: Int) async throws -> APIResponse
    func fetchHeadlines(country: String?, category: NewsCategory?, sources: [String]?, query: String?, page: Int, pageSize: Int) async throws -> APIResponse
}

struct NewsAPI: NewsAPIService {
    
    //max pageSize = 100
    func fetchNews(query: String? = nil, sources: [String]? = nil, domains: [String]? = nil, excludeDomains: [String]? = nil, from: String? = nil, to: String? = nil, language: Language = .en, sortBy: SortBy = .relevancy, page: Int = 1, pageSize: Int = 100) async throws -> APIResponse {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = "/v2/everything"
        
        components.queryItems = [
            URLQueryItem(name: "apiKey", value: apiKey),
            URLQueryItem(name: "language", value: language.rawValue),
            URLQueryItem(name: "sortBy", value: sortBy.rawValue),
            URLQueryItem(name: "pageSize", value: "\(pageSize)"),
            URLQueryItem(name: "page", value: "\(page)")
        ]
        
        if let query {
            components.queryItems?.append(URLQueryItem(name: "q", value: query))
        }

        if let sources, !sources.isEmpty {
            components.queryItems?.append(URLQueryItem(name: "sources", value: sources.joined(separator: ",")))
        }

        if let domains, !domains.isEmpty {
            components.queryItems?.append(URLQueryItem(name: "domains", value: domains.joined(separator: ",")))
        }

        if let excludeDomains, !excludeDomains.isEmpty {
            components.queryItems?.append(URLQueryItem(name: "excludeDomains", value: excludeDomains.joined(separator: ",")))
        }

        if let from {
            components.queryItems?.append(URLQueryItem(name: "from", value: from))
        }

        if let to {
            components.queryItems?.append(URLQueryItem(name: "to", value: to))
        }
        
        guard let url = components.url else {
            throw APIError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.badResponse
        }
        
        do {
            return try JSONDecoder().decode(APIResponse.self, from: data)
        } catch {
            throw APIError.badData
        }
    }
    
    // max pageSize = 100
    func fetchHeadlines(country: String? = nil, category: NewsCategory? = nil, sources: [String]? = nil, query: String? = nil, page: Int = 1, pageSize: Int = 20) async throws -> APIResponse {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = "/v2/top-headlines"
        
        
        let sourcesString = sources?.joined(separator: ", ") ?? ""
        
        components.queryItems = [
            URLQueryItem(name: "apiKey", value: apiKey),
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "category", value: category?.rawValue),
            URLQueryItem(name: "country", value: country),
            URLQueryItem(name: "sources", value: sourcesString),
            URLQueryItem(name: "pageSize", value: "\(pageSize)"),
            URLQueryItem(name: "page", value: "\(page)")
        ]
        
        
        guard let url = components.url else {
            throw APIError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.badResponse
        }
        
        do {
            return try JSONDecoder().decode(APIResponse.self, from: data)
        } catch {
            throw APIError.badData
        }
    }
}

struct NewsAPITest: NewsAPIService {
    
    //max pageSize = 100
    func fetchNews(query: String? = nil, sources: [String]? = nil, domains: [String]? = nil, excludeDomains: [String]? = nil, from: String? = nil, to: String? = nil, language: Language = .en, sortBy: SortBy = .relevancy, page: Int = 0, pageSize: Int = 100) async throws -> APIResponse {
        APIResponse(status: Status.ok.rawValue,
                    totalResults: ArticleModel.mockArray().count,
                    articles: ArticleModel.mockArray().toArticle(),
                    code: nil,
                    message: nil)
    }
    
    // max pageSize = 100
    func fetchHeadlines(country: String? = nil, category: NewsCategory? = nil, sources: [String]? = nil, query: String? = nil, page: Int = 0, pageSize: Int = 20) async throws -> APIResponse {
        try await Task.sleep(for: .seconds(2))
        return APIResponse(status: Status.ok.rawValue,
                    totalResults: ArticleModel.mockArray().count,
                    articles: ArticleModel.mockArray().toArticle(),
                    code: nil,
                    message: nil)
    }
}
