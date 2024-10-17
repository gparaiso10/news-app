//
//  NewsDetailView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 10/10/2024.
//

import SwiftUI
import SwiftData

struct NewsDetailView: View {
    @EnvironmentObject var router: Router
    @ObservedObject var viewModel: ViewModel
    
    @Environment(\.modelContext) private var context
    @Query private var favourites: [ArticleModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            NewsDetailHeader(title: viewModel.article.title, isFavourite: viewModel.isFavourite, updateFavourite: updateFavourite)
            NewsDetailBody(source: viewModel.article.source, author: viewModel.article.author, imageURL: viewModel.article.urlToImage, description: viewModel.article.articleDescription, content: viewModel.article.content, date: viewModel.article.publishedAt, showFullArticle: showFullArticle)
        }
        .onAppear {
            checkFavourites()
        }
        .padding(16)
        .withToolbar(closeAction: router.navigateBack)
    }
    
    func updateFavourite() {
        viewModel.isFavourite ? deleteFromFavourites() : addToFavourites()
        checkFavourites()
    }
    
    func addToFavourites() {
        let article = viewModel.article
        context.insert(article)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteFromFavourites() {
        let article = viewModel.article
        context.delete(article)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func checkFavourites() {
        viewModel.isFavourite = favourites.contains(where: {
            $0.title == viewModel.article.title &&
            $0.publishedAt == viewModel.article.publishedAt &&
            $0.author == viewModel.article.author
        })
    }
    
    func showFullArticle() {
        router.navigateTo(.newsDetailWeb(viewModel.article))
    }
}

#Preview {
    NewsDetailView(viewModel: NewsDetailView.ViewModel(article: ArticleModel.mockArticle()))
    .environmentObject(Router())
}

