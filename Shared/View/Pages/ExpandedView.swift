//
//  ExpandedView.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 12/08/21.
//

import SwiftUI

struct ExpandedView: View {
    var item: HNItem
//    var commentsCount: Int?
    @State private var showingCommentsSheet = false
    var body: some View {
        ZStack(alignment: .bottom) {
            if let url = item.url {
                VStack {
                    // Text(url.absoluteString).padding()
                    WebView(request: URLRequest(url: URL(string: url)!))
                        .edgesIgnoringSafeArea(.bottom)
                }
            }
            Button {
                showingCommentsSheet.toggle()
            } label: {
                HStack{
                    Image(systemName: "text.bubble")
                    Text("Comments")
                    if let commentsCount = item.descendants {
                        Text("\(commentsCount)")
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .foregroundColor(.primary)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12.0)
                        .foregroundColor(.accentColor)
                        .shadow(radius: 24)
                )
            }.padding()
        }.sheet(isPresented: $showingCommentsSheet, content: {
            NavigationView { CommentsView(parentPost: item) }
        }).navigationBarTitle(item.title!, displayMode: .inline)
    }
}
