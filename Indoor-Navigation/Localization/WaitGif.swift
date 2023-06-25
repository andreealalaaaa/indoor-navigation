//
//  WaitGif.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 22.06.2023.
//

import Foundation
import SwiftUI
import WebKit

struct WaitGif: UIViewRepresentable {
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

struct WaitGift_Previews: PreviewProvider {
    static var previews: some View {
        NavigationGifView("biggerwait.gif")
    }
}
