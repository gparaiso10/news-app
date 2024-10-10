//
//  NewsListView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 10/10/2024.
//

import SwiftUI

struct NewsListView: View {
    var articles: [ArticleModel]
    var onTapArticle: (ArticleModel) -> Void
    
    var body: some View {
        List(articles) { article in
            Button(action: { onTapArticle(article) }) {
                NewsItemView(article: article)
            }
        }
        .listStyle(.inset)
    }
}
