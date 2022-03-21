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
    
    @Published var viewedPosts = [Int]()
    
    @Published var bookmarkedStoriesID = UserDefaults.standard.object(forKey: "bookmarks") as? [Int] ?? []
    @Published var bookmarkedStories: [Item] =  []
    
    init() {  }
    
}

// MARK: - Fetch Functions
extension HackneyViewModel {
    func fetchAll() async {
        Task {
            debugPrint("::Fetching All Posts::")
            await fetchTopID()
            await fetchTopItems()
            await fetchBestID()
            await fetchBestItems()
            await fetchNewID()
            await fetchNewItems()
            await fetchAskID()
            await fetchAskItems()
            await fetchShowID()
            await fetchShowItems()
            await fetchJobsID()
            await fetchJobsItems()
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
    
    @MainActor func fetchTopItems(refresh: Bool = false) async {
        if refresh {
            topStories = []
        }
        
        if topStories.isEmpty {
            for id in topStoriesID {
                await topStories.append(fetchItem(id: id))
            }
        }
    }
    
    @MainActor func fetchNewItems(refresh: Bool = false) async {
        if refresh {
            newStories = []
        }
        
        if newStories.isEmpty {
            for id in newStoriesID {
                await newStories.append(fetchItem(id: id))
            }
        }
    }
    
    @MainActor func fetchBestItems(refresh: Bool = false) async {
        if refresh {
            bestStories = []
        }
        
        if bestStories.isEmpty {
            for id in bestStoriesID {
                await bestStories.append(fetchItem(id: id))
            }
        }
    }
    
    @MainActor func fetchAskItems(refresh: Bool = false) async {
        if refresh {
            askStories = []
        }
        
        if askStories.isEmpty {
            for id in askStoriesID {
                await askStories.append(fetchItem(id: id))
            }
        }
    }
    
    @MainActor func fetchShowItems(refresh: Bool = false) async {
        if refresh {
            showStories = []
        }
        
        if showStories.isEmpty {
            for id in showStoriesID {
                await showStories.append(fetchItem(id: id))
            }
        }
    }
    
    @MainActor func fetchJobsItems(refresh: Bool = false) async {
        if refresh {
            jobsStories = []
        }
        
        if jobsStories.isEmpty {
            for id in jobsStoriesID {
                await jobsStories.append(fetchItem(id: id))
            }
        }
    }
    
    @MainActor func fetchBookmarkItems(refresh: Bool = true) async {
        if refresh {
            bookmarkedStories = []
        }
        
        if bookmarkedStories.isEmpty {
            for id in bookmarkedStoriesID {
                await bookmarkedStories.append(fetchItem(id: id))
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

// MARK: - Bookmark
extension HackneyViewModel {
    func toggleBookmark(_ item: Int) {
        if bookmarkedStoriesID.contains(item) {
            bookmarkedStoriesID.removeAll { $0 == item }
        } else {
            bookmarkedStoriesID.insert(item, at: 0)
        }
        UserDefaults.standard.set(bookmarkedStoriesID, forKey: "bookmarks")
    }
    
    func toggleBookmark(index: IndexSet) {
        bookmarkedStoriesID.remove(atOffsets: index)
        UserDefaults.standard.set(bookmarkedStoriesID, forKey: "bookmarks")
    }
}
