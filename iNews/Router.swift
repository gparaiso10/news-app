//
//  Coordinator.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import SwiftUI

class Router: ObservableObject {
    // Contains the possible destinations in our Router
    enum Route: Hashable {
        case newsList
        case newsDetail(ArticleModel)
    }
    
    @Published var path: NavigationPath = NavigationPath()
    
    @MainActor @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .newsList:
            NewsListView()
        case .newsDetail(let article):
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
