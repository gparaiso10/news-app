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
        VStack (alignment: .center) {
            HStack {
                TextField("Search", text: $viewModel.query)
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "magnifyingglass")
                }
            }
        }.task(id: viewModel.searching) {
            if viewModel.searching {
                await viewModel.fetchResults()
            }
        }
    }
}


extension SearchPage {
    @MainActor
    class ViewModel: ObservableObject {
        var newsAPI = NewsAPITest()
        @State var searchResults: [ArticleModel] = []
        @State var query: String = ""
        @State var searching: Bool = false
        
        func fetchResults() async {
            do {
                searching = true
                let news = try await newsAPI.fetchNews()
                if news.status == Status.ok.rawValue {
                    searchResults = news.articles?
                        .toModel()
                        .filter{ $0.title != "[Removed]" } ?? []
                } else {
                    searchResults = []
                }
                searching = false
            } catch {
                //handleError(error: error)
            }
            
        }
    }
}
