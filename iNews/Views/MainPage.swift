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
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            if let errorMessage = viewModel.errorMessage {
                ErrorView(message: errorMessage)
            }
            if viewModel.isLoading {
                LoadingView()
            }
            else {
                Spacer()
                NewsListView(articles: viewModel.articles, onTapArticle: showNewsDetail)
                Spacer()
            }
        }
        .task {
            await viewModel.fetchNews()
        }
    }
    
    func showNewsDetail(_ article: ArticleModel) {
        router.navigateTo(.newsDetail(article))
    }
    
}

//#Preview {
//    MainPage()
//}
