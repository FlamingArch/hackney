//
//  PostsController.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 03/06/21.
//

import SwiftUI

enum StoriesSort: String {
    case top, new, best
}

class PostsController: ObservableObject {
    @Published var storiesSort = StoriesSort.best
    
    @Published var posts: [HNItem] = []
    @Published var ask: [HNItem] = []
    @Published var show: [HNItem] = []
    
    func getStories() {
        PostsController.getStories(storiesSort.rawValue) {
            self.getPost(ids: $0) { self.posts.append($0) }
        }
    }
    
    func getAskPosts() {
        PostsController.getStories("ask")  {
            self.getPost(ids: $0) { self.ask.append($0) }
        }
    }
    
    func getShowPosts() {
        PostsController.getStories("show")  {
            self.getPost(ids: $0) { self.show.append($0) }
        }
    }
}

//MARK: - JSON Tasks
extension PostsController {
    
    static func fetchJSON(_ url: URL?, completion: @escaping (Data?, Error?) -> Void ) {
        guard let url = url else { fatalError("Invalid URL") }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in  DispatchQueue.main.async {
            if error != nil { return completion(nil, error) }
            
            guard let response = (response as? HTTPURLResponse)?.statusCode else {
                fatalError("Response Error")
            }
            guard response == 200 else { fatalError("Response Code Error") }
            
            if let data = data { completion(data, nil) }
        } }.resume()
    }
    
    static func fetchJSON(_ id: Int, completion: @escaping (Data?, Error?) -> Void ) {
        fetchJSON(URL(string: "https://hacker-news.firebaseio.com/v0/item/\(id).json"), completion: completion)
    }
    
    static func decodeJSON <T: Decodable> (data: Data) -> T {
        if let decoded = try? JSONDecoder().decode(T.self, from: data) {
            return decoded
        } else {
            fatalError("DecodeError")
        }
    }
}

//MARK: - Network Data Tasks
extension PostsController {
    func getPost(ids: [Int], completion: @escaping (HNItem)->Void) {
        for id in ids {
            PostsController.fetchJSON(id) { data, error in
                if error != nil {
                    print("ERROR FETCHING JSON: ",error!)
                    return
                }
                if let data = data {
                    let item: HNItem = PostsController.decodeJSON(data: data)
                    completion(item)
                } else { print("Nothing Received") }
            }
        }
    }
    
    static func getStories(_ type: String = "top",completion: @escaping ([Int])->Void) {
        fetchJSON( URL (
            string: "https://hacker-news.firebaseio.com/v0/\(type)stories.json?print=pretty"
        )) { data, error in
            if error != nil {
                print(error!)
                return
            }
            if let data = data {
                completion(decodeJSON(data: data))
            }
        }
    }
}
