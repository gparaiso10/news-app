//
//  iNewsApp.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import SwiftUI
import SwiftData

@main
struct iNewsApp: App {
    var body: some Scene {
        WindowGroup {
            TabScreenView()
        }
        .modelContainer(for: ArticleModel.self)
    }
}
