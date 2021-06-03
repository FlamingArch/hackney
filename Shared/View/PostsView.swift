//
//  PostsView.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 02/06/21.
//

import SwiftUI

struct PostsView: View {
    
    var body: some View {
        let samplePost =
            HNItem(item: 200, type: .story, by: "Dig Bick Master", text: "Sup, this is supposed to be a large text. I'm just gonna copy this text again and again, cause I'm lazy and can't/won't type long sentences. Oh wait, nvm. It got quite large in just this amount of text, so I don't need to copy and paste stuff and make it boring...", url: "https://www.lttstore.com/", title: "Sample Title")
        List {
            ForEach(0..<50) { index in
                NavigationLink(
                    destination: WebView(request: URLRequest(url: URL(string: samplePost.url!)!))
                        .navigationTitle(samplePost.url!)
                        .navigationBarTitleDisplayMode(.inline)
                ) {
                    VStack(alignment: .leading) {
                        Text(samplePost.title!).font(.headline).lineLimit(1)
                        Text(samplePost.by!).font(.subheadline).lineLimit(1)
                        Text(samplePost.text!).font(.subheadline).lineLimit(2).opacity(0.5)
                    }
                }
            }
        }
        .navigationTitle("Posts")
        .onAppear {
            print(PostsController.fetchPost(8863))
        }
    }
}

