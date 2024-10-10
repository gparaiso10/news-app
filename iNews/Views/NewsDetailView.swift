//
//  NewsDetailView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 10/10/2024.
//

import SwiftUI

struct NewsDetailView: View {
    @EnvironmentObject var router: Router
    var article: ArticleModel
    
    var body: some View {
        VStack {
            Text(article.title)
            Button(action: showFullArticle) {
                Text("See full story").underline()
            }
        }
        .padding(16)
        .withToolbar(closeAction: router.navigateBack)
    }
    
    func showFullArticle() {
        router.navigateTo(.newsDetailWeb(article))
    }
}

//#Preview {
//    NewsDetailView(article: ArticleModel.mockArticle()).environmentObject(HomeRouter())
//}

