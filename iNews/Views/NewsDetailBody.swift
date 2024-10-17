//
//  NewsDetailBody.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 17/10/2024.

import SwiftUI

struct NewsDetailBody: View {
    var source: String
    var author: String
    var imageURL: String
    var description: String
    var content: String
    var date: String
    var showFullArticle: () -> Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(source)
                    Spacer()
                    Text(author)
                }.padding(.bottom, 4)
                Text(date)
                    .padding(.bottom, 8)
                if !imageURL.isEmpty {
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image
                            .resizable()
                            .frame(height: 250)
                            .clipShape(.rect(cornerRadius: 8))
                            .padding(.bottom, 8)
                    } placeholder: {
                        LoadingView(text: "Loading Image...")
                            .frame(height: 250)
                    }
                }

                Text(description)
                    .padding(.bottom, 8)
                Text(content)
                    .padding(.bottom, 16)
                
                Button(action: showFullArticle) {
                    Text("Read full story").tint(.black).underline()
                }
            }
        }.scrollIndicators(.hidden)
    }
}
