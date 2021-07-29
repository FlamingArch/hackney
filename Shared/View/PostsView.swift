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
            ForEach(controller.posts, id: \.id) { post in
                NavigationLink(
                    destination: WebView(request: URLRequest(url: URL(string: post.url!)!))
                        .navigationTitle(post.url!)
                        .navigationBarTitleDisplayMode(.inline)
                ) {
                    VStack(alignment: .leading) {
                        Text(post.title!).font(.headline).lineLimit(1)
                        Text(post.by!).font(.subheadline).lineLimit(1)
                        //                        Text(samplePost.text!).font(.subheadline).lineLimit(2).opacity(0.5)
                    }
                }
            }
        }
        .navigationTitle("Posts")
    }
}

