//
//  ViewModel.swift
//  Hackney (iOS)
//
//  Created by Harsh Chaturvedi on 19/02/22.
//

import Foundation

class HackneyViewModel: ObservableObject {
    
    @Published var topStories: [Item] = []
    @Published var topStoriesID: [Int] = []
    
    @Published var bestStories: [Item] = []
    @Published var bestStoriesID: [Int] = []
    
    @Published var newStories: [Item] = []
    @Published var newStoriesID: [Int] = []
    
    @Published var askStories: [Item] = []
    @Published var askStoriesID: [Int] = []
    
    @Published var showStories: [Item] = []
    @Published var showStoriesID: [Int] = []
    
    @Published var jobsStories: [Item] = []
    @Published var jobsStoriesID: [Int] = []
    
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
            await fetchTopID()
            await fetchBestID()
            await fetchNewID()
            await fetchAskID()
            await fetchShowID()
            await fetchJobsID()
        }
    }
    
    @MainActor func fetchTopID() async {
        topStoriesID = await fetchChannelItems(for: .topstories)
    }
    
    @MainActor func fetchBestID() async {
        topStoriesID = await fetchChannelItems(for: .beststories)
    }
    
    @MainActor func fetchNewID() async {
        topStoriesID = await fetchChannelItems(for: .newstories)
    }
    
    @MainActor func fetchAskID() async {
        topStoriesID = await fetchChannelItems(for: .askstories)
    }
    
    @MainActor func fetchShowID() async {
        topStoriesID = await fetchChannelItems(for: .showstories)
    }
    
    @MainActor func fetchJobsID() async {
        topStoriesID = await fetchChannelItems(for: .jobstories)
    }
    
    @MainActor func fetchTopItems(refresh: Bool) async {
        if refresh {
            topStories = []
        }
        
        if topStories.isEmpty {
            for id in topStoriesID {
                await topStories.append(fetchItem(id: id))
            }
        }
    }
    
    @MainActor func fetchNewItems(refresh: Bool) async {
        if refresh {
            newStories = []
        }
        
        if newStories.isEmpty {
            for id in newStoriesID {
                await newStories.append(fetchItem(id: id))
            }
        }
    }
    
    @MainActor func fetchBestItems(refresh: Bool) async {
        if refresh {
            bestStories = []
        }
        
        if bestStories.isEmpty {
            for id in bestStoriesID {
                await bestStories.append(fetchItem(id: id))
            }
        }
    }
    
    @MainActor func fetchAskItems(refresh: Bool) async {
        if refresh {
            askStories = []
        }
        
        if askStories.isEmpty {
            for id in askStoriesID {
                await askStories.append(fetchItem(id: id))
            }
        }
    }
    
    @MainActor func fetchShowItems(refresh: Bool) async {
        if refresh {
            showStories = []
        }
        
        if showStories.isEmpty {
            for id in showStoriesID {
                await showStories.append(fetchItem(id: id))
            }
        }
    }
    
    @MainActor func fetchJobsItems(refresh: Bool) async {
        if refresh {
            jobsStories = []
        }
        
        if jobsStories.isEmpty {
            for id in jobsStoriesID {
                await jobsStories.append(fetchItem(id: id))
            }
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

