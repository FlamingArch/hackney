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
        
        List {
            if (viewModel.topStories.count == 0) {
                HStack {
                    ProgressView()
                        .scaleEffect(0.5)
                    Text("Fetching Posts")
                }
                .padding()
            }
            
            ForEach(viewModel.topStories) { item in
                Text("\(item.id)")
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    // TODO: Implement Logout
                    print("Not Implemented")
                } label: {
                    Label("Hide Viewed", systemImage: "eye.slash")
                }
            }
        }
        .navigationTitle("Top Stories")
        .task {
            await viewModel.fetchTopStories()
        }
    }
}
