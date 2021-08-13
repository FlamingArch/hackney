//
//  ExpandedView.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 12/08/21.
//

import SwiftUI

struct ExpandedView: View {
    var url: URL?
    var commentsCount: Int?
    @State private var showingCommentsSheet = false
    var body: some View {
        ZStack(alignment: .bottom) {
            if let url = url {
                VStack {
//                    Text(url.absoluteString).padding()
                    WebView(request: URLRequest(url: url))
                        .edgesIgnoringSafeArea(.bottom)
                }
            }
            Button {
                showingCommentsSheet.toggle()
            } label: {
                HStack{
                    Image(systemName: "text.bubble")
                    Text("Comments")
                    if let commentsCount = commentsCount {
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
            ExpandedCommentsView()
        })
    }
}
struct ExpandedView_Previews: PreviewProvider {
    static var  previews: some View {
        ExpandedView(url: URL(string: "https://www.google.com"), commentsCount: 12)
            .preferredColorScheme(.dark)
    }
}
