//
//  hackneyApp.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 12/04/21.
//

import SwiftUI

@main
struct hackneyApp: App {
    @ObservedObject private var controller = PostsController()
    var body: some Scene {
        WindowGroup {
            if UIDevice.current.userInterfaceIdiom == .pad{
                SidebarView(controller: controller)
            } else{
                TabbedView(controller: controller)
            }
        }
    }
}
