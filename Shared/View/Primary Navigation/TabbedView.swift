//
//  TabView.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 06/08/21.
//

import SwiftUI

struct TabbedView: View {
    
    @ObservedObject var controller: PostsController
    
    var body: some View {
        TabView {
            NavigationView{
                StoriesView(controller: controller)
            }.tabItem { Label("Stories", systemImage: "newspaper") }
            
            // NavigationView{
            //     CommentsView(controller: controller)
            // }.tabItem { Label("Comments", systemImage: "text.bubble") }
            
            NavigationView{
                AskView(controller: controller)
            }.tabItem { Label("Ask", systemImage: "questionmark.circle") }
            
            NavigationView{
                ShowView(controller: controller)
            }.tabItem { Label("Show", systemImage: "eye.circle") }
        }
    }
}
