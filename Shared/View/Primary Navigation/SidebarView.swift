//
//  SidebarView.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 02/06/21.
//

import SwiftUI

struct SidebarView: View {
    @State private var selection: Int? = 0
    @ObservedObject var controller: PostsController
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: PostsView(controller: controller),
                    tag: 0,
                    selection: $selection
                ) {
                    Label(
                        title: { Text("Posts") },
                        icon: { Image(systemName: "newspaper") }
                    )
                }
                NavigationLink(
                    destination: CommentsView(controller: controller),
                    tag: 1,
                    selection: $selection
                ) {
                    Label(
                        title: { Text("Comments") },
                        icon: { Image(systemName: "text.bubble") }
                    )
                }
                NavigationLink(
                    destination: AskView(controller: controller),
                    tag: 2,
                    selection: $selection
                ) {
                    Label(
                        title: { Text("Ask") },
                        icon: { Image(systemName: "questionmark.circle") }
                    )
                }
                NavigationLink(
                    destination: ShowView(controller: controller),
                    tag: 3,
                    selection: $selection
                ) {
                    Label(
                        title: { Text("Show") },
                        icon: { Image(systemName: "eye.circle") }
                    )
                }
                
                //Section(header: Text("Library")) {
                //    NavigationLink(destination: Text("Saved Posts")) {
                //        Label(
                //            title: { Text("Saved Posts") },
                //            icon: { Image(systemName: "bookmark") }
                //        )
                //    }
                //}
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Hackney")
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
    }
}

