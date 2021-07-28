//
//  PostsController.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 03/06/21.
//

import SwiftUI

struct PostsController {
    var posts: [HNItem] = []
    
    static func fetchJSON(_ id: Int, completion: @escaping (Data?, Error?) -> Void ) {
        guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(id).json") else {
            fatalError("Invalid URL")
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if error != nil { return completion(nil, error) }
                
                let response = (response as? HTTPURLResponse)?.statusCode
                guard let response = response else {
                    fatalError("Response Error")
                }
                guard response == 200 else {
                    fatalError("Response Code Error")
                }
                
                if let data = data {
                    completion(data, nil)
                }
            }
        }.resume()
        
    }
}
