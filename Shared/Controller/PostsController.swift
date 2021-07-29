//
//  PostsController.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 03/06/21.
//

import SwiftUI

class PostsController: ObservableObject {
    
    struct TopPosts {
        var posts: [Int]
    }
    
    @Published var posts: [HNItem] = []
    
    init() { PostsController.getTopStoriesIDs { self.getPosts(ids: $0) } }
    
    static func fetchJSON(_ url: URL?, completion: @escaping (Data?, Error?) -> Void ) {
        guard let url = url else {
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
    
    static func decodeJSON <T: Decodable> (data: Data) -> T {
        if let decoded = try? JSONDecoder().decode(T.self, from: data) {
            return decoded
        } else {
            fatalError("DecodeError")
        }
    }
    
    func getPosts(ids: [Int]) {
        for id in ids {
            PostsController.fetchJSON(id) { data, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let data = data {
                    self.posts.append(PostsController.decodeJSON(data: data))
                } else { print("Nothing Received") }
            }
        }
    }
    
    static func getTopStoriesIDs(completion: @escaping ([Int])->Void) {
        
        fetchJSON(URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty")) { data, error in
            if error != nil {
                print(error!)
                return
            }
            if let data = data {
                completion(decodeJSON(data: data))
            }
        }

//        completion([ 27998878, 27996684, 27996321, 27997167, 27997923, 27998323, 27998058, 27998642, 27998439, 27971019, 27998250, 27998109, 27996057, 27995788, 27998708, 27998282, 27993882, 27998958, 27980463, 27996130, 27996348, 27970847, 27992500, 27995057, 27985167, 27969978, 27971454, 27994866, 27994369, 27994092, 27994194, 27994692, 27991322, 27999112, 27993564, 27995313, 27996237, 27998837, 27996703, 27996693, 27993850, 27994480, 27994914, 27971255, 27997613, 27995130, 27992073, 27997599, 27997224, 27998732, 27992953, 27991120, 27970113, 27998648 ])
    }
    
}
