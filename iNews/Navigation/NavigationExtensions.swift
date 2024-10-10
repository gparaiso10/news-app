//
//  Extensions.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 10/10/2024.
//

import SwiftUI

extension TabScreenView {
    func tabSelection() -> Binding<Tab> {
        Binding {
            self.selectedTab
        } set: { tappedTab in
            if tappedTab == self.selectedTab {
                if homeRouter.path.isEmpty {
                    //User already on home view, scroll to top
                } else {
                    homeRouter.popToRoot()
                }
            }
            self.selectedTab = tappedTab
        }
    }
}
