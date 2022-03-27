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
        if viewModel.bookmarkedStoriesID.isEmpty {
            Group {
                Text("No Stories Bookmarked")
            }
        } else {
            Group {
                if viewModel.bookmarkedStories.isEmpty {
                    ProgressView()
                } else {
                    List {
                        ForEach(viewModel.bookmarkedStories) { item in
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
                    Text("\(viewModel.bookmarkedStoriesID.count) Items")
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
}

struct Bookmarks_Previews: PreviewProvider {
    static var previews: some View {
        Bookmarks()
    }
}
