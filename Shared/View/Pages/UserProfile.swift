//
//  UserProfile.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 17/02/22.
//

import SwiftUI

struct UserProfile: View {
    @EnvironmentObject var viewModel: HackneyViewModel
    
    var body: some View {
        List {
#if os(iOS)
            if (UIDevice.current.userInterfaceIdiom == .phone) {
                NavigationLink {
                    Bookmarks()
                } label: {
                    Label("Bookmarks", systemImage: "star")
                }
            }
#endif
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    if (viewModel.signedInUser == nil) {
                        viewModel.signIn(id: "FlamingArch")
                    } else  {
                        viewModel.signOut()
                    }
                } label: {
                    Label(
                        viewModel.signedInUser == nil ? "Login" : "Logout",
                        systemImage: "power"
                    )
                }
            }
        }
        .navigationTitle("User")
    }
}

