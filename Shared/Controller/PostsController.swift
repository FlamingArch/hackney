//
//  PostsController.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 03/06/21.
//

import SwiftUI

struct PostsController {
    var posts: [HNItem] = []
    
    static func fetchPost(_ id: Int) -> String {
        var dataGot: String = "nil"
        let url = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(id).json")
        let session = URLSession.shared.dataTask(with: url!) { data, res, err in
            guard let data = data else { return }
            dataGot = String(data: data, encoding: .utf8) ?? "Nil"
        }
        session.resume()
        return dataGot
    }
}
