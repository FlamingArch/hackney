//
//  hackneyApp.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 12/04/21.
//

import SwiftUI

@main
struct hackneyApp: App {
    @State private var selection: Int? = 0
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
