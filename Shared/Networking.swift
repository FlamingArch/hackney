//
//  Networking.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 20/02/22.
//

import Foundation

// MARK: Base
func fetchData(_ url: String) async throws -> Data {
    debugPrint("=> Networking -> fetchData(): Checking URL")
    guard let url = URL(string: url) else {
        fatalError("Invalid URL")
    }
    
    debugPrint("=> Networking -> fetchData(): Creating Request Object")
    let request = URLRequest(url: url)
    
    let (data, _) = try await URLSession.shared.data(for: request)
    return data
}

func decodeData<T: Decodable>(_ data: Data) throws -> T {
    debugPrint("=> Networking -> decodeData(): Decoding Object of type \(T.self)")
    return try JSONDecoder().decode(T.self, from: data)
}

// MARK: - Helpers
func fetchItem(id: Int) async -> Item {
    let url = baseUrl + "item/\(id).json?print=pretty"
    
    debugPrint("=> Networking -> fetchItem() -> Fetching Data")
    debugPrint("=> Networking -> fetchItem")
    guard let data = try? await fetchData(url) else {
        fatalError("Error Fetching Data")
    }
    
    debugPrint("=> Networking -> fetchItems() -> Decoding Data")
    guard let decoded: Item = try? decodeData(data) else {
        fatalError("Error Decoding Data")
    }
    
    return decoded
}

func fetchChannelItems(for channel: Channels) async -> [Int] {
    let url = baseUrl + "\(channel.rawValue).json?print=pretty"
    
    debugPrint("=> Networking -> fetchChannelItem() -> Fetching Data")
    guard let data = try? await fetchData(url) else {
        fatalError("Error Fetching Data")
    }
    
    debugPrint("=> Networking -> fetchChannelItems() -> Decoding Data")
    guard let decoded: [Int] = try? decodeData(data) else {
        fatalError("Error Decoding Data")
    }
    
    return decoded
    
}
