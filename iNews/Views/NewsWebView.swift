//
//  NewsDetailView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import SwiftUI

struct NewsWebView: View {
    @EnvironmentObject var router : Router
    @State var article: ArticleModel
    
    var body: some View {
            WebView(webPage: article.url)
            .withToolbar(closeAction: router.navigateBack)
        }
}

//#Preview {
//    NewsWebView(article: ArticleModel.mockArticle()).environmentObject(HomeRouter())
//}
