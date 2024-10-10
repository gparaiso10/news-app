//
//  NewsItemView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import SwiftUI

struct NewsItemView: View {
    let article: ArticleModel
    
    var body: some View {
        VStack (alignment: .leading) {
            Spacer()
            Text(article.title)
                .frame(height: 48)
                .truncationMode(.tail)
            Spacer()
        }
    }
}
