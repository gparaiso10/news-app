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
        VStack(alignment: .leading) {
            ForEach(articles, id: \.id) { article in
                NewsItemView(article: article, onTap: onTapArticle)
                    .frame(height: 40)
                    .padding(.vertical, 16)
            }
        }
    }
}


#Preview {
    NewsListView(articles: ArticleModel.mockArray(), onTapArticle: { _ in})
}






