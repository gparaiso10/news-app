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
        VStack(alignment: .leading) {
            NewsDetailHeader(title: article.title)
            NewsDetailBody(source: article.source, author: article.author, imageURL: article.urlToImage, description: article.description, content: article.content, showFullArticle: showFullArticle)
        }
        .padding(16)
        .withToolbar(closeAction: router.navigateBack)
    }
    
    func showFullArticle() {
        router.navigateTo(.newsDetailWeb(article))
    }
}

struct NewsDetailHeader: View {
    var title: String
    
    var body: some View {
        Text(title)
            .bold()
            .font(.system(size: 24))
            .padding(.bottom, 16)
    }
}

struct NewsDetailBody: View {
    var source: String
    var author: String
    var imageURL: String
    var description: String
    var content: String
    var showFullArticle: () -> Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(source)
                    Spacer()
                    Text(author)
                }.padding(.bottom, 4)
                AsyncImage(url: URL(string: imageURL)) { image in
                    image
                        .resizable()
                        .frame(height: 250)
                        .clipShape(.rect(cornerRadius: 8))
                        .padding(.bottom, 8)
                } placeholder: {
                    LoadingView()
                        .frame(height: 250)
                }
                Text(description)
                    .padding(.bottom, 8)
                Text(content)
                    .padding(.bottom, 16)
                
                Button(action: showFullArticle) {
                    Text("Read full story").tint(.black).underline()
                }
            }
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    NewsDetailView(article: ArticleModel.mockArticle()).environmentObject(Router())
}

