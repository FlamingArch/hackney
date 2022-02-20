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
        Text("Hello, World!")
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
            .navigationTitle("New Stories")
            .task {
                await viewModel.fetchAll()
            }
    }
}

