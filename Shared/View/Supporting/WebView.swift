//
//  WebView.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 18/03/22.
//

import SwiftUI
import WebKit

#if os(macOS)
struct WebView: NSViewRepresentable {
    @State var request: URLRequest
    
    func makeNSView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateNSView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}

#else
struct WebView: UIViewRepresentable {
    @State var request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}
#endif
