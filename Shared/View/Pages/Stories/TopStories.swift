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
                Text(item.title ?? "Unknown Title")
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    
                } label: {
                    Label("Hide Viewed", systemImage: "eye")
                }
            }
        }
    }
}
