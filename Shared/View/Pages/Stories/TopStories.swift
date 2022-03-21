//
//  TopStories.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 17/02/22.
//

import SwiftUI

struct TopStories: View {
    
    @EnvironmentObject var viewModel: HackneyViewModel
    
    var body: some View {
        Group {
            if (viewModel.topStories.count < 12) {
                ProgressView()
            } else {
                List {
                    ForEach(viewModel.topStories) { item in
                        NavigationLink {
                            PostScreen(item: item)
                        } label: {
                            PostListItem(item: item)
                        }
                        .swipeActions {
                            Button {
                                viewModel.toggleBookmark(item.id)
                            } label: {
                                Label(
                                    "Bookmark", systemImage: (viewModel.bookmarkedStoriesID.contains(item.id) ? "star.fill" : "star")
                                )
                            }
                            .tint(.yellow)
                        }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    // TODO: Implement Hide Viewed Posts
                } label: {
                    Label("Hide Viewed", systemImage: "eye")
                }
            }
        }
        .navigationTitle(Text("Top Stories"))
    }
}
