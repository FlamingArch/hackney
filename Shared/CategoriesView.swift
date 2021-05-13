//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 12/04/21.
//
import SwiftUI
struct CategoriesView: View {
    var categories = [["newspaper", "Posts"], ["questionmark.circle","AskHN"], ["eye.fill","Show"], ["briefcase","Jobs"]]
    #if os(macOS)
    private let listStyle = SidebarListStyle()
    #else
    private let listStyle = InsetGroupedListStyle()
    #endif
        
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Hacker News")) {
                    ForEach(0..<categories.count) { index in
                        NavigationLink(destination: Text("Sup").navigationTitle(categories[index][1])) {
                            Image(systemName: categories[index][0])
                                .foregroundColor(.accentColor)
                            Text(categories[index][1])
                        }
                    }
                }
                Section(header: Text("More")) {
                    NavigationLink(destination: Text("Sup").navigationTitle("Saved")) {
                        Image(systemName: "newspaper")
                        Text("Saved")
                    }
                }
            }
            .listStyle(listStyle)
            .navigationTitle("Hackney")
        }
    }
}

