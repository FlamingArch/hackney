//
//  ExpandedCommentsView.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 12/08/21.
//

import SwiftUI

struct CommentsView: View {
    @Environment(\.presentationMode) var presentationMode
    var parentPost: HNItem
    @State private var comments = [HNItem]()
    var body: some View {
        List {
            if comments.count < Int(parentPost.descendants! / 10) {
                HStack {
                    ProgressView()
                    Text("Loading Comments")
                        .padding(.leading).foregroundColor(.secondary)
                }
            }
            ForEach(comments, id:\.id) { item in
                if let text = item.text {
                    NavigationLink(destination: ExpandedComment(text: text, by: item.by ?? "")) {
                        VStack(alignment: .leading) {
                            Text(text).lineLimit(3)
                            HStack {
                                if let score = item.score {
                                    Text("\(score) Points · ").foregroundColor(.secondary)
                                }
                                if let by = item.by {
                                    Text("By " + by).foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
            }
        }.onAppear {
            PostsController.getPost(ids: parentPost.kids!) { self.comments.append($0) }
        }
        .toolbar {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: { Text("Close") }
        }.navigationTitle("Comments")
    }
}

