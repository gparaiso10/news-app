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
        FavouriteNewsListView(articles: viewModel.favouriteArticles, onTapArticle: showDetail)
            .withToolbar()
            .task {
                await viewModel.fetchFavourites()
            }
    }
    
    func showDetail(_ article: ArticleModel) {
        router.navigateTo(.newsDetail(article))
    }
}

#Preview {
    FavouriteNewsView().environmentObject(Router())
}
