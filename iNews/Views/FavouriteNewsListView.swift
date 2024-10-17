//
//  FavouriteNewsListView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 16/10/2024.
//

import SwiftUI

struct FavouriteNewsListView: View {
    var articles: [ArticleModel]
    var onTapArticle: (ArticleModel) -> Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(articles, id: \.id) { article in
                    FavouriteNewsItemView(article: article, onTapArticle: onTapArticle)
                }
                Spacer()
            }
        }.scrollIndicators(.hidden)
    }
}
