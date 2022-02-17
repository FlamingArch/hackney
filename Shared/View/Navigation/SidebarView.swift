//
//  SidebarView.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 17/02/22.
//

import SwiftUI

struct SidebarView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        TopStories()
                    } label: {
                        Label("Top", systemImage: "arrow.up.right.circle")
                    }
                    NavigationLink {
                        NewStories()
                    } label: {
                        Label("New", systemImage: "star")
                    }
                    NavigationLink {
                        BestStories()
                    } label: {
                        Label("Best", systemImage: "heart")
                    }
                } header: {
                    Text("Stories")
                }
                Section {
                    NavigationLink {
                        AskStories()
                    } label: {
                        Label("Ask", systemImage: "questionmark")
                    }
                    NavigationLink {
                        ShowStories()
                    } label: {
                        Label("Show", systemImage: "eye")
                    }
                    NavigationLink {
                        JobsStories()
                    } label: {
                        Label("Jobs", systemImage: "briefcase")
                    }
                } header: {
                    Text("More")
                }
                
                Section {
                    NavigationLink {
                        UserProfile()
                    } label: {
                        Label("Flam3Sm0k3", systemImage: "person")
                    }
                } header: {
                    Text("User")
                }
            }
            .listStyle(SidebarListStyle())
            
            TopStories()
            
            Text("No Post Selected")
        }
    }
}

