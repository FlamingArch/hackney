//
//  HackneyApp.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 17/02/22.
//

import SwiftUI

@main
struct HackneyApp: App {
    @StateObject var viewModel = HackneyViewModel()
    var body: some Scene {
        WindowGroup {
            Group {
#if os(macOS)
                SidebarView()
#else
                if (UIDevice.current.userInterfaceIdiom == .phone) {
                    TabbedView()
                } else {
                    SidebarView()
                }
#endif
            }
            .environmentObject(viewModel)
        }
    }
}
