//
//  PostScreen.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 18/03/22.
//

import SwiftUI

struct PostScreen: View {
    var item: Item
    @EnvironmentObject var viewModel: HackneyViewModel
    
    var body: some View {
        WebView(request: URLRequest(url: URL(string: item.url ?? "https://www.apple.com")!))
            .navigationTitle(Text(item.title ?? "Unknown Title"))
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        // TODO: Implement Hide Viewed Posts
                        viewModel.toggleBookmark(item.id)
                    } label: {
                        Label("Bookmark", systemImage: viewModel.bookmarks.contains(item.id) ? "star.fill" : "star")
                    }
                }
            }
#if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
#endif
    }
}

