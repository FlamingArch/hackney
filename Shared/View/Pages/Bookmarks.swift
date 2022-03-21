//
//  Bookmarks.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 20/03/22.
//

import SwiftUI

struct Bookmarks: View {
    
    @EnvironmentObject var viewModel: HackneyViewModel
    
    var body: some View {
        Group {
            if viewModel.bookmarkedPosts.isEmpty {
                ProgressView()
            } else {
                List {
                    ForEach(viewModel.bookmarkedPosts) { item in
                        NavigationLink {
                            PostScreen(item: item)
                        } label: {
                            PostListItem(item: item)
                            #if os(macOS)
                                .onDeleteCommand {
                                    viewModel.toggleBookmark(item.id)
                                }
                            #endif
                        }
                    }
                    .onDelete(perform: viewModel.toggleBookmark)
                }
            }
        }
        .navigationTitle("Bookmarks")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
#if os(macOS)
                Text("\(viewModel.bookmarks.count) Items")
#else
                EditButton()
#endif
            }
        }
        .task {
            await viewModel.fetchBookmarkItems()
        }
    }
}

struct Bookmarks_Previews: PreviewProvider {
    static var previews: some View {
        Bookmarks()
    }
}
