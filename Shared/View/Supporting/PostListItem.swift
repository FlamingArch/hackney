//
//  PostListItem.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 18/03/22.
//

import SwiftUI

struct PostListItem: View {
    var item: Item
    var body: some View {
        VStack (alignment: .leading) {
            Text(item.title ?? "Unknown Title")
            Text("By \(item.by ?? "Unknown User")")
                .foregroundColor(.secondary)
        }
    }
}
