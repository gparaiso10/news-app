//
//  FavouriteNewsItemView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 16/10/2024.
//
import SwiftUI

struct FavouriteNewsItemView: View {
    var article: ArticleModel
    var onTapArticle: (ArticleModel) -> Void
    
    var body: some View {
        HStack {
            NewsItemView(article: article, onTap: onTapArticle)
                .frame(height: 40)
                .padding(.vertical, 16)
            Spacer()
            Button(action: { print("Add to favourites") }) {
                Image(systemName: "heart")
            }
        }
        .padding(.horizontal, 16)
    }
}
