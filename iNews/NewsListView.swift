//
//  NewsListView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import SwiftUI

struct NewsListView: View {
    @EnvironmentObject var router: Router
    @State var articles: [ArticleModel] = []
    @State var isLoading: Bool = false
    @State var errorMessage: String?
    
    var body: some View {
        if errorMessage != nil {
            Text(errorMessage!)
        } else {
            List(articles) { article in
                Button(action: { showNewsDetail(article) }) {
                    NewsItemView(article: article)
                }
            }
            .listStyle(.inset)
            .task {
                isLoading = true
                do {
                    let news = try await APIService().fetchNews()
                    if news.status == Status.ok.rawValue {
                        articles = news.articles.toModel()
                    } else {
                        articles = []
                    }
                    isLoading = false
                } catch let error as ApiError {
                    switch error {
                    case .badURL:
                        errorMessage = "Bad URL"
                    case .badResponse:
                        errorMessage = "Bad Response"
                    case .badData:
                        errorMessage = "Bad data"
                    }
                    isLoading = false
                    
                } catch {
                    errorMessage = "Unkown Error"
                    isLoading = false
                }
            }
            .sheet(isPresented: $isLoading, content: {
                Text("Loading...")
            })
        }
    }
        
    func showNewsDetail(_ article: ArticleModel) {
        router.navigateTo(.newsDetail(article))
    }
    
}


struct NewsItemView: View {
    let article: ArticleModel
    
    var body: some View {
        VStack (alignment: .leading) {
            Spacer()
            Text(article.title)
            Text(article.description)
                .frame(height: 48)
                .truncationMode(.tail)
            Spacer()
        }
    }
}



//#Preview {
//    NewsListView()
//}
