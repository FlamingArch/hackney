//
//  PostsView.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 02/06/21.
//

import SwiftUI

struct PostsView: View {
    @ObservedObject var controller: PostsController
    var body: some View {
        List {
            if (controller.posts.count < 20) { ProgressView() }
            ForEach(controller.posts, id: \.id) { post in
                NavigationLink(
                    destination:
                        post.url != nil ?
                        WebView(request: URLRequest(url: URL(string: post.url!)!))
                        .navigationBarTitle(post.url!, displayMode: .inline)
                        : WebView(request: URLRequest(url: URL(string: "https://news.ycombinator.com")!))
                        .navigationBarTitle("https://news.ycombinator.com", displayMode: .inline)
                ) {
                    StoryItem(title: post.title, score: post.score, descendants: post.descendants, by: post.by)
                }
            }
        }
        .navigationTitle("Stories")
        .onAppear { controller.getStories() }
    }
}

