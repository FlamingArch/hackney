//
//  ViewModel.swift
//  Hackney (iOS)
//
//  Created by Harsh Chaturvedi on 19/02/22.
//

import Foundation
import CloudKit

class HackneyViewModel: ObservableObject {
    
    
    @Published var topStories: [Item] = []
    @Published var bestStories: [Item] = []
    @Published var newStories: [Item] = []
    
    @Published var askStories: [Item] = []
    @Published var showStories: [Item] = []
    @Published var jobsStories: [Item] = []
    
    @Published var signedInUser: User?
    
    init() {  }
    
    func fetchAll() async {
        Task {
            print("Fetching All Posts")
            await fetchTopStories()
            await fetchBestStories()
            await fetchNewStories()
            await fetchAskStories()
            await fetchShowStories()
            await fetchJobsStories()
        }
    }
    
    func fetchTopStories() async {
        let ids = await fetchChannelItems(channel: "topstories")
        topStories = await fetchPosts(postIDs: ids)
    }
    
    func fetchBestStories() async {
        let ids = await fetchChannelItems(channel: "beststories")
        bestStories = await fetchPosts(postIDs: ids)
    }
    
    func fetchNewStories() async {
        let ids = await fetchChannelItems(channel: "newstories")
        newStories = await fetchPosts(postIDs: ids)
    }
    
    func fetchAskStories() async {
        let ids = await fetchChannelItems(channel: "askstories")
        askStories = await fetchPosts(postIDs: ids)
    }
    
    func fetchShowStories() async {
        let ids = await fetchChannelItems(channel: "showStories")
        showStories = await fetchPosts(postIDs: ids)
    }
    
    func fetchJobsStories() async {
        let ids = await fetchChannelItems(channel: "jobstories")
        jobsStories = await fetchPosts(postIDs: ids)
    }
    
    
    func signIn(id: String) {
        signedInUser = User(id: id, created: 0, karma: 0, about: "Sup", submitted: [])
    }
    
    func signOut() {
        signedInUser = nil
    }
}
