//
//  NavigationGifView.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 20.06.2023.
//

import SwiftUI
import WebKit

struct NavigationGifView: UIViewRepresentable {
    private let name: String
    init(_ name: String){
        self.name = name
    }
    
    func makeUIView(context: Context) -> WKWebView{
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        
        webView.load(data, mimeType: "image/gif", characterEncodingName: "UTF-8", baseURL: url.deletingLastPathComponent())
        
        webView.scrollView.isScrollEnabled = false
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context){
        uiView.reload()
    }
    
}

struct NavigationGifView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationGifView("Navigation.gif")
    }
}
