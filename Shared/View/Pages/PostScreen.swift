//
//  PostScreen.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 18/03/22.
//

import SwiftUI

struct PostScreen: View {
    var item: Item?
    @State private var showingSheet = false
    @EnvironmentObject var viewModel: HackneyViewModel
    
    var body: some View {
        Group {
            if item == nil {
                Text("No Item Selected")
            } else {
                WebView(request: URLRequest(url: URL(string: item?.url ?? "https://news.ycombinator.com")!))
            }
        }
        .navigationTitle(Text(item?.title ?? "Unknown Title"))
#if os(iOS)
        .sheet(isPresented: $showingSheet) {
            ActivityView(activityItems: [NSURL(string: item?.url ?? "https://news.ycombinator.com")!] as [Any], applicationActivities: nil)
        }
#endif
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    if item != nil {
                        viewModel.toggleBookmark(item!.id)
                    }
                } label: {
                    Label(
                        "Bookmark",
                        systemImage: item != nil
                        ? (viewModel.bookmarkedStoriesID.contains(item!.id) ? "star.fill" : "star")
                        : "star")
                }
                .disabled(item == nil)
            }
#if os(iOS)
            ToolbarItem(placement: .primaryAction) {
                Button {
                    showingSheet = true
                } label: {
                    Label("Share",systemImage: "square.and.arrow.up")
                }
                .disabled(item == nil)
            }
#endif
        }
#if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
    }
    
}

