//
//  CoordinatorView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import SwiftUI

struct RouterView<Content: View>: View {
    @EnvironmentObject var router: Router
    var rootView: Content

    var body: some View {
            NavigationStack(path: $router.path) {
                rootView
                    .navigationDestination(for: Router.Route.self) { route in
                        router.view(for: route)
                    }
            }
        .environmentObject(router)
    }
}
