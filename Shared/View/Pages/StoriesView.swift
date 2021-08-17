//
//  PostsView.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 02/06/21.
//

import SwiftUI

struct StoriesView: View {
    @ObservedObject var controller: PostsController
    var body: some View {
        List {
            if (controller.posts.count < 20) { HStack {
                ProgressView()
                Text("Loading Stories")
                    .padding(.leading).foregroundColor(.secondary)
            } }
            ForEach(controller.posts, id: \.id) { post in
                NavigationLink(
                    destination:
                        ExpandedView(item: post)
                ) {
                    StoryItem(title: post.title, score: post.score, descendants: post.descendants, by: post.by)
                }
            }
        }
        .navigationTitle("Stories")
        .onAppear { controller.getStories() }
    }
}
