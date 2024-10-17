//
//  NewsListView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import SwiftUI

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
                HeadlinesView(sections: viewModel.articles, onTapArticle: showNewsDetail)
//                Button(action: { viewModel.currentPage += 1 }) {
//                    Text("Next Page")
//                }
            }
        }
        .withToolbar()
        .task {
            await viewModel.bind()
        }
//        .task(id: viewModel.currentPage, {
//            await viewModel.fetchHeadlinesByCategory()
//        })
    }
    
    func showNewsDetail(_ article: ArticleModel) {
        router.navigateTo(.newsDetail(article))
    }
    
}


//#Preview {
//    MainPage()
//}
