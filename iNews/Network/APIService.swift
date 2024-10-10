//
//  NewsListViewModel.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import Foundation

class APIService {
    
    func fetchNews() async throws -> APIResponse {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = "/v2/everything"
        components.queryItems = [
            URLQueryItem(name: "apiKey", value: apiKey),
            URLQueryItem(name: "q", value: "Apple"), //search for articles that mention value
            URLQueryItem(name: "from", value: "2024-10-08"), //yyyy-mm-dd
            URLQueryItem(name: "sortBy", value: "popularity") //relevancy, popularity, publishedAt
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
