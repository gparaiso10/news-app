//
//  FavouriteNewsViewModel.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 15/10/2024.
//

import Foundation

extension FavouriteNewsView {
    
    @MainActor
    class ViewModel: ObservableObject {
        @Published var favouriteArticles: [ArticleModel] = []
        
        // TODO: implement Actor to fetch and save favourites
        func fetchFavourites() async {
            favouriteArticles = ArticleModel.mockArray()
        }
    }
}
