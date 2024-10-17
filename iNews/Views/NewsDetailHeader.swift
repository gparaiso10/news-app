//
//  NewsDetailHeader.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 17/10/2024.
//

import SwiftUI

struct NewsDetailHeader: View {
    var title: String
    var isFavourite: Bool
    var updateFavourite: () -> Void
    
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .bold()
                .font(.system(size: 24))
            Spacer()
            Button(action: updateFavourite) {
                Image(systemName: isFavourite ? "bookmark.circle.fill" : "bookmark.circle")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .foregroundStyle(isFavourite ? .yellow : .gray)
                    .padding(.top, 8)
            }
        }
        .padding(.bottom, 32)
    }
}
