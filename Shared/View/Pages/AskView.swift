//
//  AskView.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 07/08/21.
//

import SwiftUI

struct AskView: View {
    @ObservedObject var controller: PostsController
    var body: some View {
        List {
            if (controller.ask.count < 20) { HStack {
                ProgressView()
                Text("Loading AskHN Items")
                    .padding(.leading).foregroundColor(.secondary)
            } }
            ForEach(controller.ask, id: \.id) { post in
                NavigationLink(
                    destination:
                        post.url != nil ?
                        WebView(request: URLRequest(url: URL(string: post.url!)!))
                        .navigationBarTitle(post.url!, displayMode: .inline)
                        : WebView(request: URLRequest(url: URL(string: "https://news.ycombinator.com")!))
                        .navigationBarTitle("https://news.ycombinator.com", displayMode: .inline)
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
        .navigationTitle("Ask")
        .onAppear { controller.getAskPosts() }
    }
}
