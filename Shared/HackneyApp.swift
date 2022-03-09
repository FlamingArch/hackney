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
#if os(macOS)
            SidebarView()
                .environmentObject(viewModel)
                .alert(viewModel.alertTitle, isPresented: $viewModel.showingAlert) {
                    Button("Retry") {
                        // TODO: Implement Retry
                    }
                } message: {
                    Text(viewModel.alertMessage)
                }

#else
            if (UIDevice.current.userInterfaceIdiom == .phone) {
                TabbedView()
                    .environmentObject(viewModel)
            } else {
                SidebarView()
                    .environmentObject(viewModel)
            }
#endif
        }
    }
}
