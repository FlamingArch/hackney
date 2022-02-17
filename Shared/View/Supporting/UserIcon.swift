//
//  UserIcon.swift
//  Hackney (iOS)
//
//  Created by Harsh Chaturvedi on 17/02/22.
//

import SwiftUI

struct UserIcon: View {
    var image: Image?
    
    var body: some View {
        ZStack {
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
            } else {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.accentColor)
                    .scaleEffect(0.5)
            }
        }
        .background(
            Circle()
                .foregroundColor(.secondary.opacity(0.2))
        )
        .clipShape(Circle())
    }
}
