//
//  ShowStories.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 17/02/22.
//

import SwiftUI

struct ShowStories: View {
    
    @EnvironmentObject var viewModel: HackneyViewModel
    
    var body: some View {
        Text("Sup")
            .toolbar {
                Group {
                    if (viewModel.showStories.count < 12) {
                        ProgressView()
                    } else {
                        List {
                            ForEach(viewModel.showStories) { item in
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
                .navigationTitle(Text("Show Stories"))
            }
    }
}
