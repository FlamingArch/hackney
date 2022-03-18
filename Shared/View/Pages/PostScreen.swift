//
//  PostScreen.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 18/03/22.
//

import SwiftUI

struct PostScreen: View {
    var item: Item
    
    var body: some View {
        WebView(request: URLRequest(url: URL(string: item.url ?? "https://www.apple.com")!))
            .navigationTitle(Text(item.title ?? "Unknown Title"))
    }
}

