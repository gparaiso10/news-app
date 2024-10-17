//
//  Coordinator.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import SwiftUI

class Router: ObservableObject {
    enum Route: Hashable {
        case newsDetail(ArticleModel)
        case newsDetailWeb(ArticleModel)
    }
    
    @Published var path: [Route] = []
    
    @MainActor @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .newsDetail(let article):
            NewsDetailView(viewModel: NewsDetailView.ViewModel(article: article))
        case .newsDetailWeb(let article):
            NewsWebView(article: article)
        }
    }

    func navigateTo(_ appRoute: Route) {
        path.append(appRoute)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
