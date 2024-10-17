
//
//  ViewModel.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 17/10/2024.
//

import Foundation

extension SearchPage {
    @MainActor
    class ViewModel: ObservableObject {
        var newsAPI = NewsAPI()
        @Published var searchResults: [ArticleModel] = []
        @Published var query: String = ""
        @Published var searching: Bool = false
        
        func fetchResults() async {
            do {
                let news = try await newsAPI.fetchNews(query: self.query)
                if news.status == Status.ok.rawValue {
                    searchResults = news.articles?
                        .toModel()
                        .filter{ $0.title != "[Removed]" } ?? []
                } else {
                    searchResults = []
                }
            } catch {
                //handleError(error: error)
            }
            searching = false
        }
    }
}
