//
//  hackneyApp.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 12/04/21.
//

import SwiftUI

@main
struct hackneyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SidebarView()
                Text("No Selection Made")
                Text("Nothing to Show")
            }
        }
    }
}
