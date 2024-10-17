//
//  TabView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 10/10/2024.
//

import SwiftUI

struct TabScreenView: View {
    
    @State var selectedTab: Tab = .home
        
    @State var homeRouter = Router()
    @State var favouritesRouter = Router()
    @State var searchRouter = Router()
    
    @State var mainPage = MainPage()
    @State var searchPage = SearchPage()
    @State var favouritesView = FavouriteNewsView()

    var body: some View {
        
        TabView(selection: tabSelection()) {
            Group {
                RouterView(rootView: mainPage)
                    .environmentObject(homeRouter)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(Tab.home)
                
                RouterView(rootView: searchPage)
                    .environmentObject(searchRouter)
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    .tag(Tab.search)
                
                RouterView(rootView: favouritesView)
                    .environmentObject(favouritesRouter)
                    .tabItem {
                        Label("Shelf", systemImage: "books.vertical.fill")
                    }
                    .tag(Tab.favourites)
                

            }
            .toolbarBackground(.thickMaterial, for: .tabBar)
            .toolbarBackgroundVisibility(.visible, for: .tabBar)
        }
    }
}

