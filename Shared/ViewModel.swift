//
//  ViewModel.swift
//  Hackney (iOS)
//
//  Created by Harsh Chaturvedi on 19/02/22.
//

import Foundation

class HackneyViewModel: ObservableObject {
    
    @Published var topStories: [Item] = []
    @Published var bestStories: [Item] = []
    @Published var newStories: [Item] = []
    
    @Published var askStories: [Item] = []
    @Published var showStories: [Item] = []
    @Published var jobsStories: [Item] = []
    
    @Published var signedInUser: User?
    
    @Published var showingAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    
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
    
    @MainActor func fetchTopStories() async {
        print("::Fetching Top Stories::")
        await fetchChannelItems(for: Channels.topstories.rawValue) { item in
            self.topStories.append(item)
        }
    }
    
    @MainActor func fetchBestStories() async {
        print("::Fetching Best Stories::")
        await fetchChannelItems(for: Channels.beststories.rawValue) { item in
            self.topStories.append(item)
        }
    }
    
    @MainActor func fetchNewStories() async {
        print("::Fetching New Stories::")
        await fetchChannelItems(for: Channels.newstories.rawValue) { item in
            self.topStories.append(item)
        }
    }
    
    @MainActor func fetchAskStories() async {
        print("::Fetching Ask Stories::")
        await fetchChannelItems(for: Channels.askstories.rawValue) { item in
            self.topStories.append(item)
        }
    }
    
    @MainActor func fetchShowStories() async {
        print("::Fetching Ask Stories::")
        await fetchChannelItems(for: Channels.showstories.rawValue) { item in
            self.topStories.append(item)
        }
    }
    
    @MainActor func fetchJobsStories() async {
        print("::Fetching Jobs Stories::")
        await fetchChannelItems(for: Channels.jobstories.rawValue) { item in
            self.topStories.append(item)
        }
    }
    
    
    func signIn(id: String) {
        signedInUser = User(id: id, created: 0, karma: 0, about: "Sup", submitted: [])
    }
    
    func signOut() {
        signedInUser = nil
    }
}
