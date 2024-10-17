//
//  Extensions.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 10/10/2024.
//

import SwiftUI


extension View {
    @MainActor @ViewBuilder func withToolbar(closeAction: (() -> Void)? = nil, leadingText: String? = nil, withBorder: Bool = false) -> some View {
        GeometryReader { geometry in
            self
                .toolbar {
                    if let leadingText {
                        ToolbarItem(placement: .topBarLeading) {
                            VStack {
                                Spacer()
                                Text(leadingText)
                                    .frame(maxWidth:geometry.size.width*(4/5), maxHeight: 8)
                            }
                        }
                    }
                    
                    if let closeAction {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: closeAction) {
                                Image(systemName: "xmark")
                                    .tint(.black)
                                    .frame(height: 8)
                                    .padding(4)
                            }
                        }
                    }
                }
                .navigationBarBackButtonHidden()
                .toolbarBackground(.white, for: .navigationBar)
                .toolbarBackgroundVisibility(.visible, for: .navigationBar)
        }
        .overlay(withBorder ?
                 Rectangle().frame(width: nil, height: 1, alignment: .top)
            .foregroundColor(Color.black) :
                    Rectangle().frame(width: nil, height: nil, alignment: .top)
            .foregroundColor(Color.clear),
                 alignment: .top)
    }
}
