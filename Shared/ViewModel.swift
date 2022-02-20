//
//  ViewModel.swift
//  Hackney (iOS)
//
//  Created by Harsh Chaturvedi on 19/02/22.
//

import Foundation

class HackneyViewModel: ObservableObject {
    
    var sample =  Data("""
{
  "by" : "dhouston",
  "descendants" : 71,
  "id" : 8863,
  "kids" : [ 9224, 8917, 8952, 8958, 8884, 8887, 8869, 8873, 8940, 8908, 9005, 9671, 9067, 9055, 8865, 8881, 8872, 8955, 10403, 8903, 8928, 9125, 8998, 8901, 8902, 8907, 8894, 8870, 8878, 8980, 8934, 8943, 8876 ],
  "score" : 104,
  "time" : 1175714200,
  "title" : "My YC app: Dropbox - Throw away your USB drive",
  "type" : "story",
  "url" : "http://www.getdropbox.com/u/2/screencast.html"
}
""".utf8)
    
    @Published var topStories: [Item] = []
    @Published var bestStories: [Item] = []
    @Published var newStories: [Item] = []
    
    @Published var askStories: [Item] = []
    @Published var showStories: [Item] = []
    @Published var jobsStories: [Item] = []
    
    @Published var signedInUser: User?
    
    init() {  }
    
    func fetchAll() {
        fetchTopStories()
        fetchBestStories()
        fetchNewStories()
        fetchAskStories()
        fetchShowStories()
        fetchJobsStories()
    }
    
    func fetchTopStories() {
        topStories.append(try! JSONDecoder().decode(Item.self, from: self.sample))
    }
    
    func fetchBestStories() {
        
    }
    
    func fetchNewStories() {
        
    }
    
    func fetchAskStories() {
        
    }
    
    func fetchShowStories() {
        
    }
    
    func fetchJobsStories() {
        
    }
    
    
    func signIn(id: String) {
        signedInUser = User(id: id, created: 0, karma: 0, about: "Sup", submitted: [])
    }
    
    func signOut() {
        signedInUser = nil
    }
}
