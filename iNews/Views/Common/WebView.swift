//
//  WebView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 10/10/2024.
//

import SwiftUI
import WebKit

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
