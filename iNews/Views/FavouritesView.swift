//
//  FavouritesView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 10/10/2024.
//

import SwiftUI

struct FavouriteNewsView: View {
    @EnvironmentObject var router: Router
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NewsListView(articles: viewModel.favouriteArticles,
                     onTapArticle: showDetail)
        .task {
            await viewModel.fetchFavourites()
        }
    }
    
    func showDetail(_ article: ArticleModel) {
        router.navigateTo(.newsDetail(article))
    }
}


extension FavouriteNewsView {
    
    @MainActor
    class ViewModel: ObservableObject {
        @Published var favouriteArticles: [ArticleModel] = []
        
        // TODO: implement Actor to fetch and save favourites
        func fetchFavourites() async {
            favouriteArticles = ArticleModel.mockArray()
        }
    }
}
