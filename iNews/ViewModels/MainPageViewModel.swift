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
        @Published var articles: [ArticleModel] = []
        @Published var isLoading: Bool = false
        @Published var errorMessage: String?
        
        func fetchNews() async {
            if !articles.isEmpty { return }
            do {
                isLoading = true
                let news = try await APIService().fetchNews()
                if news.status == Status.ok.rawValue {
                    articles = news.articles?
                        .toModel()
                        .filter{ $0.title != "[Removed]" } ?? []
                } else {
                    articles = []
                }
                isLoading = false
            } catch let error as ApiError {
                handleAPIError(error: error)
            } catch {
                handleError(error: error)
            }
        }
        
        func handleAPIError(error: ApiError) {
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
            errorMessage = "Unkown Error"
            isLoading = false
        }
    }
}
