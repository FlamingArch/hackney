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
            NavigationLink("Sup") {
                Text("Sup Inside")
            }
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
//                        viewModel.signedInUser == nil ? "Login" :
                            "Logout",
                        systemImage: "power"
                    )
                }
            }
        }
        .navigationTitle("User")
    }
}

