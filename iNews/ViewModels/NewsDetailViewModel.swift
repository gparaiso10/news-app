//
//  ViewModel.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 17/10/2024.
//

import Foundation

extension NewsDetailView {
    @MainActor
    class ViewModel: ObservableObject {
        @Published var article: ArticleModel
        @Published var isFavourite: Bool = false
        
        init(article: ArticleModel) {
            self.article = article
        }
    }
}
