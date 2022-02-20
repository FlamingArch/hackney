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
    }
}
