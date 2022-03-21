//
//  PostScreen.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 18/03/22.
//

import SwiftUI

struct PostScreen: View {
    var item: Item?
    @EnvironmentObject var viewModel: HackneyViewModel
    
    var body: some View {
        Group {
            if item == nil {
                Text("No Item Selected")
            } else {
                WebView(request: URLRequest(url: URL(string: item?.url ?? "https://www.apple.com")!))
            }
        }
        .navigationTitle(Text(item?.title ?? "Unknown Title"))
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    // TODO: Implement Hide Viewed Posts
                    if item != nil {
                        viewModel.toggleBookmark(item!.id)
                    }
                } label: {
                    Label(
                        "Bookmark",
                        systemImage: item != nil
                        ? (viewModel.bookmarks.contains(item!.id) ? "star.fill" : "star")
                        : "star")
                }
                .disabled(item == nil)
            }
        }
#if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
    }
}

