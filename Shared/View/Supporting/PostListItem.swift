//
//  PostListItem.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 18/03/22.
//

import SwiftUI

struct PostListItem: View {
    
    @EnvironmentObject var viewModel: HackneyViewModel
    
    var item: Item
    var body: some View {
        VStack (alignment: .leading) {
            Text(item.title ?? "Unknown Title")
            HStack {
                if viewModel.bookmarks.contains(item) {
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Text("By \(item.by ?? "Unknown User")")
                    .foregroundColor(.secondary)
                
            }
        }
    }
}
