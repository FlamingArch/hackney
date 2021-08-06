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
                
                TabbedView(controller: controller)
                
            
        }
    }
}
