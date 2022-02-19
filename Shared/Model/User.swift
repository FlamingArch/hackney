//
//  User.swift
//  Hackney (iOS)
//
//  Created by Harsh Chaturvedi on 19/02/22.
//

import Foundation

struct User: Identifiable {
    var id: String
    var created: Int
    var karma: Int
    var about: String
    var submitted: [Item]
}
