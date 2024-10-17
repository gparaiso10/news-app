//
//  SearchPage.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 16/10/2024.
//

import SwiftUI


struct SearchPage: View {
    @EnvironmentObject var router: Router
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                TextField("Search", text: $viewModel.query)
                Spacer()
                Button(action: {
                    viewModel.searching = true
                }) {
                    Image(systemName: "magnifyingglass")
                }
            }
            .padding(16)
            
            List {
                NewsListView(articles: viewModel.searchResults, onTapArticle: goToDetail)
            }
            .listStyle(.inset)
            .scrollIndicators(.hidden)
            Spacer()
        }
        .task(id: viewModel.searching) {
            if viewModel.searching {
                await viewModel.fetchResults()
            }
        }
    }
    
    func goToDetail(_ article: ArticleModel) {
        router.navigateTo(.newsDetail(article))
    }
}


#Preview {
    SearchPage().environmentObject(Router())
}
