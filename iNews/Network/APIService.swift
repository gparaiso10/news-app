//
//  NewsListViewModel.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import Foundation

enum Language: String {
    case ar
    case de
    case en
    case es
    case fr
    case he
    case it
    case nl
    case no
    case pt
    case ru
    case sv
    case ud
    case zh
}

enum SortBy: String {
    case relevancy
    case popularity
    case publishedAt
}

struct APIService: Sendable {
    
    //max pageSize = 100
    func fetchNews(query: String? = nil, sources: [String]? = nil, domains: [String]? = nil, excludeDomains: [String]? = nil, from: String? = nil, to: String? = nil, language: Language = .en, sortBy: SortBy = .relevancy, page: Int = 0, pageSize: Int = 100) async throws -> APIResponse {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = "/v2/everything"
        
        let sourcesString = sources?.reduce("", { "\($0), \($1)"}) ?? ""
        let domainsString = domains?.reduce("", { "\($0), \($1)"}) ?? ""
        let excludedDomainsString = excludeDomains?.reduce("", { "\($0), \($1)"}) ?? ""
        
        components.queryItems = [
            URLQueryItem(name: "apiKey", value: apiKey),
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "sources", value: sourcesString),
            URLQueryItem(name: "domains", value: domainsString),
            URLQueryItem(name: "excludeDomains", value: excludedDomainsString),
            URLQueryItem(name: "from", value: from),
            URLQueryItem(name: "to", value: to),
            URLQueryItem(name: "language", value: language.rawValue),
            URLQueryItem(name: "sortBy", value: sortBy.rawValue),
            URLQueryItem(name: "pageSize", value: "\(pageSize)"),
            URLQueryItem(name: "page", value: "\(page)")
        ]
        
        guard let url = components.url else {
            throw ApiError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ApiError.badResponse
        }
        
        do {
            return try JSONDecoder().decode(APIResponse.self, from: data)
        } catch {
            throw ApiError.badData
        }
    }
    
    // max pageSize = 100
    func fetchHeadlines(country: String? = nil, category: NewsCategory? = nil, sources: [String]? = nil, query: String? = nil, page: Int = 0, pageSize: Int = 20) async throws -> APIResponse {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = "/v2/top-headlines"
        
        
        let sourcesString = sources?.reduce("", { "\($0), \($1)"}) ?? ""
        
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
            throw ApiError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ApiError.badResponse
        }
        
        do {
            return try JSONDecoder().decode(APIResponse.self, from: data)
        } catch {
            throw ApiError.badData
        }
    }
}

enum ApiError: Error {
    case badURL
    case badResponse
    case badData
}


extension APIService {
    private var apiKey: String {
      get {
        guard let filePath = Bundle.main.path(forResource: "NW-Info", ofType: "plist") else {
          fatalError("Couldn't find file 'NW-Info.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
          fatalError("Couldn't find key 'API_KEY'.")
        }
        return value
      }
    }
}
