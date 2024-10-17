//
//  FavouritesView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 10/10/2024.
//

import SwiftUI
import SwiftData

struct FavouriteNewsView: View {
    @EnvironmentObject var router: Router
//    @ObservedObject var viewModel = ViewModel()
    
    @Query private var articles: [ArticleModel]
    
    var body: some View {
        List {
            NewsListView(articles: articles, onTapArticle: showDetail)
        }
        .listStyle(.inset)
        .scrollIndicators(.hidden)
        .withToolbar()
    }
    
    func showDetail(_ article: ArticleModel) {
        router.navigateTo(.newsDetail(article))
    }
}

#Preview {
    FavouriteNewsView().environmentObject(Router())
}
