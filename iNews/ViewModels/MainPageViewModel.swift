//
//  MainPageViewModel.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 11/10/2024.
//

import Foundation

extension MainPage {
    
    @MainActor
    class ViewModel: ObservableObject {
        private let api = NewsAPITest() //
        @Published var articles: [NewsCategory : [ArticleModel]] = [:]
        @Published var isLoading: Bool = false
        @Published var errorMessage: String?
        @Published var currentPage: Int = 0
        
        func bind() async {
            if !articles.isEmpty { return }
            await fetchHeadlinesByCategory()
        }
        
        func fetchNews() async {
//            do {
//                isLoading = true
//                let news = try await APIService().fetchNews()
//                if news.status == Status.ok.rawValue {
//                    articles = news.articles?
//                        .toModel()
//                        .filter{ $0.title != "[Removed]" } ?? []
//                } else {
//                    articles = []
//                }
//                isLoading = false
//            } catch {
//                handleError(error: error)
//            }
        }
        
        func fetchHeadlinesByCategory() async {
            do {
                isLoading = true
                
                try await withThrowingTaskGroup(of: (category: NewsCategory, news: [Article]).self) { group in
                    for category in NewsCategory.allCases {
                        group.addTask {
                            let news = try await self.api.fetchHeadlines(category: category, page: self.currentPage)
                            return (category, news.articles ?? [])
                        }
                    }
                    
                    for try await segment in group {
                        self.articles[segment.category] = segment.news.toModel().filter{ $0.title != "[Removed]" }
                    }
                }
                isLoading = false
            } catch {
                handleError(error: error)
            }
        }
        
        func handleAPIError(error: APIError) {
            switch error {
            case .badURL:
                errorMessage = "Bad URL"
            case .badResponse:
                errorMessage = "Bad Response"
            case .badData:
                errorMessage = "Bad data"
            }
            isLoading = false
        }
        
        func handleError(error: Error) {
            if error is APIError {
                handleAPIError(error: error as! APIError)
                return
            }
            errorMessage = "Unkown Error"
            isLoading = false
        }
    }
}
