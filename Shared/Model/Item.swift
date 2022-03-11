//
//  Item.swift
//  Hackney (iOS)
//
//  Created by Harsh Chaturvedi on 19/02/22.
//

import Foundation

enum ItemType: String {
    case job, story, comment, poll, pollopt
}

struct Item: Decodable, Identifiable {
    var id: Int
    var deleted: Bool?
    var type: String?
    var by: String?
    var time: Int?
    var text: String?
    var dead: Bool?
    var parent: Int?
    var poll: Int?
    var kids: [Int]?
    var url: String?
    var score: Int?
    var title: String?
    var parts: [Int]?
    var decendants: Int?
}
