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
    
    @Published var showingAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    
    @Published var signedInUser: User?
    
    
    init() {  }
    
}

// MARK: - Fetch Functions
extension HackneyViewModel {
    func fetchAll() async {
        Task {
            debugPrint("::Fetching All Posts::")
            await fetchTopStories()
            await fetchBestStories()
            await fetchNewStories()
            await fetchAskStories()
            await fetchShowStories()
            await fetchJobsStories()
        }
    }
    
    @MainActor func fetchTopStories() async {
        debugPrint("::Fetching Top Stories::")
        await fetchChannelItems(for: Channels.topstories.rawValue) { item in
            self.topStories.append(item)
        }
    }
    
    @MainActor func fetchBestStories() async {
        debugPrint("::Fetching Best Stories::")
        await fetchChannelItems(for: Channels.beststories.rawValue) { item in
            self.topStories.append(item)
        }
    }
    
    @MainActor func fetchNewStories() async {
        debugPrint("::Fetching New Stories::")
        await fetchChannelItems(for: Channels.newstories.rawValue) { item in
            self.topStories.append(item)
        }
    }
    
    @MainActor func fetchAskStories() async {
        debugPrint("::Fetching Ask Stories::")
        await fetchChannelItems(for: Channels.askstories.rawValue) { item in
            self.topStories.append(item)
        }
    }
    
    @MainActor func fetchShowStories() async {
        debugPrint("::Fetching Ask Stories::")
        await fetchChannelItems(for: Channels.showstories.rawValue) { item in
            self.topStories.append(item)
        }
    }
    
    @MainActor func fetchJobsStories() async {
        debugPrint("::Fetching Jobs Stories::")
        await fetchChannelItems(for: Channels.jobstories.rawValue) { item in
            self.topStories.append(item)
        }
    }
}


// MARK: - Authentication
extension HackneyViewModel {
    func signIn(id: String) {
        signedInUser = User(id: id, created: 0, karma: 0, about: "Sup", submitted: [])
    }
    
    func signOut() {
        signedInUser = nil
    }
}

