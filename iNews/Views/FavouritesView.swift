//
//  FavouritesView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 10/10/2024.
//

import SwiftUI

struct FavouriteNewsView: View {
    @EnvironmentObject var router: Router
    @State var favouriteArticles: [ArticleModel] = ArticleModel.mockArray()
    
    var body: some View {
        NewsListView(articles: favouriteArticles,
                     onTapArticle: { (article) in
            router.navigateTo(.newsDetail(article))
        })
    }
}
