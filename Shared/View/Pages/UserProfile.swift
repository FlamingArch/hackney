//
//  UserProfile.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 17/02/22.
//

import SwiftUI

struct UserProfile: View {
    
    var body: some View {
        List {
            NavigationLink("Sup") {
                Text("Sup Inside")
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    // TODO: Implement Logout
                    print("Not Implemented")
                } label: {
                    Label("Logout", systemImage: "power")
                }
            }
        }
        .navigationTitle("User")
    }
}

