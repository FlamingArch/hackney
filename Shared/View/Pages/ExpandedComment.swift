//
//  ExpandedComment.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 13/08/21.
//

import SwiftUI

struct ExpandedComment: View {
    var item: HNItem
    @State private var replies = [HNItem]()
    
    var body: some View {
        List {
            Section { Text(item.text!).padding() }
            if let kids = item.kids{ Section(header: Text("Replies")) {
                if replies.count < kids.count { HStack {
                    ProgressView()
                    Text("Loading Replies")
                        .padding(.leading).foregroundColor(.secondary)
                } }
                ForEach(replies, id: \.id) { reply in
                    NavigationLink(destination: ExpandedComment(item: reply)) {
                        VStack(alignment: .leading) {
                            Text(reply.text!)
                            Text(reply.by!).foregroundColor(.secondary)
                        }
                    }
                }
            } }
        }.navigationTitle("By " + item.by!).listStyle(InsetGroupedListStyle())
        .onAppear {
            if let kids = item.kids {
                if replies.count==0 { PostsController.getPost(ids: kids) { replies.append($0) } }
            }
        }
    }
}
