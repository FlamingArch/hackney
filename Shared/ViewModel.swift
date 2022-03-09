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
            print("::Fetching All Posts::")
            await fetchTopStories()
            await fetchBestStories()
            await fetchNewStories()
            await fetchAskStories()
            await fetchShowStories()
            await fetchJobsStories()
        }
    }
    
    func fetchTopStories() async {
        print("::Fetching Top Stories::")
        let ids = await fetchID(for: "topstories")
        print("=> Fetched IDs: \(ids.debugDescription)")
    }
    
    func fetchBestStories() async {
        print("::Fetching Best Stories::")
        let ids = await fetchID(for: "beststories")
        print("=> Fetched IDs: \(ids.debugDescription)")
        bestStories = await fetchPosts(postIDs: ids)
    }
    
    func fetchNewStories() async {
        print("::Fetching New Stories::")
        let ids = await fetchID(for: "newstories")
        print("=> Fetched IDs: \(ids.debugDescription)")
        newStories = await fetchPosts(postIDs: ids)
    }
    
    func fetchAskStories() async {
        print("::Fetching Ask Stories::")
        let ids = await fetchID(for: "askstories")
        print("=> Fetched IDs: \(ids.debugDescription)")
        askStories = await fetchPosts(postIDs: ids)
    }
    
    func fetchShowStories() async {
        print("::Fetching Show Stories::")
        let ids = await fetchID(for: "showStories")
        print("=> Fetched IDs: \(ids.debugDescription)")
        showStories = await fetchPosts(postIDs: ids)
    }
    
    func fetchJobsStories() async {
        print("::Fetching Jobs Stories::")
        let ids = await fetchChannelItems(channel: "jobstories")
        print("=> Fetched IDs: \(ids.debugDescription)")
        jobsStories = await fetchPosts(postIDs: ids)
    }
    
    
    func signIn(id: String) {
        signedInUser = User(id: id, created: 0, karma: 0, about: "Sup", submitted: [])
    }
    
    func signOut() {
        signedInUser = nil
    }
}
