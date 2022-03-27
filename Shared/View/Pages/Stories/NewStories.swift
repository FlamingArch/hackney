//
//  NewStories.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 17/02/22.
//

import SwiftUI

struct NewStories: View {
    
    @EnvironmentObject var viewModel: HackneyViewModel
    
    var body: some View {
        Group {
            if (viewModel.newStories.count < 12) {
                ProgressView()
            } else {
                List {
                    ForEach(viewModel.newStories) { item in
                        NavigationLink {
                            PostScreen(item: item)
                        } label: {
                            PostListItem(item: item)
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
        .navigationTitle(Text("New Stories"))
        .task {
            await viewModel.fetchNewID()
            await viewModel.fetchNewItems()
        }
    }
}

