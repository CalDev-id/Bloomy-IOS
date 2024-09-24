//
//  WebView.swift
//  Bloomy
//
//  Created by Heical Chandra on 24/09/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        if let url = url {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
