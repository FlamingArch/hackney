//
//  CommentsView.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 06/08/21.
//

import SwiftUI

struct ShowView: View {
    @ObservedObject var controller: PostsController
    var body: some View {
        List {
            if (controller.ask.count < 20) { HStack {
                ProgressView()
                Text("Loading ShowHN Items")
                    .padding(.leading).foregroundColor(.secondary)
            } }
            ForEach(controller.show, id: \.id) { post in
                NavigationLink(
                    destination:
                        ExpandedView(item: post)
                ) {
                    VStack(alignment: .leading) {
                        Text(post.title!).font(.headline).lineLimit(3)
                        if let unwrapped = post.text {
                            Text(unwrapped).lineLimit(3)
                        }
                        HStack {
                            if let unwrapped = post.score {
                                Text(String(unwrapped) + " Points").font(.subheadline).lineLimit(1)
                            }
                            if let unwrapped = post.descendants {
                                Text(String(unwrapped) + " Comments").font(.subheadline).lineLimit(1)
                            }
                        }
                        Text("By " + post.by!).font(.subheadline).lineLimit(1).foregroundColor(.secondary)
                    }
                }
            }
        }
        .navigationTitle("Show")
        .onAppear { controller.getShowPosts() }
    }
}