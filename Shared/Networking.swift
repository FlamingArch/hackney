//
//  Networking.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 20/02/22.
//

import Foundation
import SwiftUI


var baseUrl = "https://hacker-news.firebaseio.com/v0/"

// MARK: Networking
func fetchData(url: String) async -> Data {
    guard let url = URL(string: url) else {
        fatalError("ERROR Networking::fetchData : Invalid URL")
    }
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    } catch {
        fatalError("ERROR Networking::fetchData : Error Fetching Data: \(error.localizedDescription)")
    }
}

func fetchDataCompletion(url: String, completion handler: @escaping (Data)->Void ) {
    guard let url = URL(string: url) else {
        print("ERROR Networking::fetchData : Invalid URL")
        return
    }
    URLSession.shared.dataTask(with: url) { data, _, _ in
        if let data = data {
            handler(data)
        }
    }.resume()
}

func fetchChannelItems(channel: String) async  -> [Int]{
    let data = await fetchData(url: baseUrl + channel + ".json")
    let items: [Int] = decodeData(json: data)
    return items
}

func fetchPosts(postIDs ids: [Int]) async -> [Item] {
    var items = [Item]();
    
    for id in ids {
        let data = await fetchData(url: baseUrl + "item/\(id).json")
        let item: Item = decodeData(json: data)
        items.append(item)
    }
    
    return items;
}

func decodeData<T: Decodable>(json data: Data) -> T {
    do {
        print("=> Trying to decode data:\n\(data.debugDescription)\n")
        return try JSONDecoder().decode(T.self, from: data)
    }
    catch {
        fatalError("Error Decoding Data")
    }
}

func fetchJSON(url: String) async -> Data {
    
    guard let url = URL(string: url) else {
        fatalError("Invalid URL")
    }
    
    let request = URLRequest(url: url)
    
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    } catch {
        fatalError("Error Fetching data over Network. Are you connected to internet?")
    }
    
}

func fetchID(for channel: String) async -> [Int] {
    let json = await fetchJSON(url: baseUrl + "\(channel).json?print=pretty")
    let decoded: [Int] = decodeData(json: json)
    return decoded
}

func fetchItems(_ id: Int) -> Item {
    return Item(id: id)
}
