//
//  SidebarView.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 02/06/21.
//

import SwiftUI

struct SidebarView: View {
    @State private var selection: Int? = 0
    
    var body: some View {
        List {
            NavigationLink(
                destination: PostsView(),
                tag: 0,
                selection: $selection
            ) {
                Label(
                    title: { Text("Posts") },
                    icon: { Image(systemName: "newspaper") }
                )
            }
            NavigationLink(
                destination: Text("Destination Comments"),
                tag: 1,
                selection: $selection
            ) {
                Label(
                    title: { Text("Comments") },
                    icon: { Image(systemName: "text.bubble") }
                )
            }
            NavigationLink(
                destination: Text("Destination Ask"),
                tag: 2,
                selection: $selection
            ) {
                Label(
                    title: { Text("Ask") },
                    icon: { Image(systemName: "questionmark.circle") }
                )
            }
            NavigationLink(
                destination: Text("Destination Show"),
                tag: 3,
                selection: $selection
            ) {
                Label(
                    title: { Text("Show") },
                    icon: { Image(systemName: "eye.circle") }
                )
            }
            
            Section(header: Text("Library")) {
                NavigationLink(destination: Text("Saved Posts")) {
                    Label(
                        title: { Text("Saved Posts") },
                        icon: { Image(systemName: "bookmark") }
                    )
                }
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Hackney")
    }
}

