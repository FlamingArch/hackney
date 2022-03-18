//
//  JobsStories.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 17/02/22.
//

import SwiftUI

struct JobsStories: View {
    
    @EnvironmentObject var viewModel: HackneyViewModel
    
    var body: some View {
        Group {
            if (viewModel.jobsStories.count < 12) {
                ProgressView()
            } else {
                List {
                    ForEach(viewModel.jobsStories) { item in
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
        .navigationTitle(Text("Job Stories"))
    }
}
