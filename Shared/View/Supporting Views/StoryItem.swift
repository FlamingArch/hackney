//
//  StoryItem.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 09/08/21.
//

import SwiftUI

struct StoryItem: View {
    var title: String?
    var score: Int?
    var descendants: Int?
    var by: String?
    var body: some View {
        VStack(alignment: .leading) {
            Text(title!).font(.headline).lineLimit(3)
            HStack {
                if let unwrapped = score {
                    Text(String(unwrapped) + " Points").font(.subheadline).lineLimit(1)
                }
                if let unwrapped = descendants {
                    Text(String(unwrapped) + " Comments").font(.subheadline).lineLimit(1)
                }
            }
            Text("By " + by!).font(.subheadline).lineLimit(1).foregroundColor(.secondary)
        }
    }
}
