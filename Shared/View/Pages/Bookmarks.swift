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
        List {
            ForEach(viewModel.bookmarks) { item in
                NavigationLink {
                    PostScreen(item: item)
                } label: {
                    PostListItem(item: item)
                        .onDeleteCommand {
                            viewModel.toggleBookmark(item)
                        }
                }
            }
        }
        .navigationTitle("Bookmarks")
    }
}

struct Bookmarks_Previews: PreviewProvider {
    static var previews: some View {
        Bookmarks()
    }
}
