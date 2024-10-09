//
//  NewsDetailView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 09/10/2024.
//

import SwiftUI
import WebKit

struct NewsWebView: View {
    @State var article: ArticleModel
    @EnvironmentObject var router : Router
    
    var body: some View {
            WebView(webPage: article.url)
                .padding(.top, 16)
                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Color.black), alignment: .top)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text(article.title)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            router.navigateBack()
                        }) {
                            Image(systemName: "xmark")
                                .tint(.black)
                                .padding(4)
                        }
                    }
                }
                .navigationBarBackButtonHidden()
        }
    
}

struct WebView: UIViewRepresentable {
 
    let webView: WKWebView
    let webPage: String
    
    init(webPage: String) {
        webView = WKWebView(frame: .zero)
        self.webPage = webPage
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        webView.load(URLRequest(url: URL(string: webPage)!))
    }
}
