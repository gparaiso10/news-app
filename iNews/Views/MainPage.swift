//
//  NewsListView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import SwiftUI
//TODO: move functions to viewModel

struct MainPage: View {
    @EnvironmentObject var router: Router
    @State var articles: [ArticleModel] = []
    @State var isLoading: Bool = false
    @State var errorMessage: String?
    
    var body: some View {
        VStack {
            if let errorMessage {
                ErrorView(message: errorMessage)
            }
            if isLoading {
                LoadingView()
            }
            else {
                Spacer()
                NewsListView(articles: articles, onTapArticle: showNewsDetail)
                Spacer()
            }
        }
        .task {
            await fetchNews()
        }
    }
    
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
    
    func showNewsDetail(_ article: ArticleModel) {
        router.navigateTo(.newsDetail(article))
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

//#Preview {
//    MainPage()
//}
