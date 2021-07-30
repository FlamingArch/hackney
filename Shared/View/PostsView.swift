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
                        : WebView(request: URLRequest(url: URL(string: "https://apple.com")!))
                        .navigationBarTitle("https://example.com", displayMode: .inline)
                ) {
                    VStack(alignment: .leading) {
                        Text(post.title!).font(.headline).lineLimit(1)
                        Text(post.by!).font(.subheadline).lineLimit(1)
                        // Text(samplePost.text!).font(.subheadline).lineLimit(2).opacity(0.5)
                    }
                }
            }
        }
        .navigationTitle("Posts")
    }
}

