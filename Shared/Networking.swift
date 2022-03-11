//
//  Networking.swift
//  Hackney
//
//  Created by Harsh Chaturvedi on 20/02/22.
//

import Foundation
import SwiftUI

enum Channels :String {
    case topstories,
         beststories,
         newstories,
         askstories,
         showstories,
         jobstories
}

var debug = true

func debugPrint(_ msg: String) {
    if debug {
        print(msg)
    }
}

var baseUrl = "https://hacker-news.firebaseio.com/v0/"

// MARK: - Base Functions
func fetchJSON(url: String) async -> Data {
    
    debugPrint("=> fetchJSON() -> Checking URL...")
    guard let url = URL(string: url) else {
        fatalError("Invalid URL")
    }
    
    debugPrint("=> fetchJSON() -> Creating Request Object...")
    let request = URLRequest(url: url)
    
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    } catch {
        fatalError("Error Fetching data over Network. Are you connected to internet?\nError Description: \(error.localizedDescription)")
    }
    
}

func decodeData<T: Decodable>(json data: Data) -> T {
    do {
        debugPrint("=> Trying to decode data:\n\(data.debugDescription)\n")
        return try JSONDecoder().decode(T.self, from: data)
    }
    catch {
        fatalError("Error Decoding Data")
    }
}

// MARK: - Helper Functions
func fetchID(for channel: String) async -> [Int] {
    let url = baseUrl + "\(channel).json?print=pretty"
    
    if debug {
        print("=> fetchID -> Fetching IDs from URL: \(url)")
    }
    
    let json = await fetchJSON(url: url)
    let decoded: [Int] = decodeData(json: json)
    
    if debug{
        print("=> fetchID -> Fetched IDs: \(decoded)")
    }
    
    return decoded
}

func fetchItem(_ id: Int) -> Item {
    return Item(id: id)
}

func fetchChannelItems(for channel: String, completion handler: @escaping(Item)->Void) async {
    let ids = await fetchID(for: "topstories")
    print("=> fetchChannelItems -> Fetched IDs: \(ids.debugDescription)")
    
    for id in ids {
        let itemJSON = await fetchJSON(url: baseUrl + "\(id).json?print=pretty")
        let decodedItem: Item = decodeData(json: itemJSON)
        
        handler(decodedItem)
    }
}

// MARK: - Deprecated Functions
@available(*, deprecated, message:"fetchData is deprecated, and will be removed in fututre versions. Use fetchJSON instead.")
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

@available(*, deprecated, message:"fetchDataCompletion is deprecated, and will be removed in fututre versions. Use fetchJSON instead.")
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

@available(*, deprecated, message:"fetchChannelItem is deprecated, and will be removed in fututre versions. Use fetchID instead.")
func fetchChannelItems(channel: String) async  -> [Int]{
    let data = await fetchData(url: baseUrl + channel + ".json")
    let items: [Int] = decodeData(json: data)
    return items
}

@available(*, deprecated, message:"fetchChannelItem([Int]) is deprecated, and will be removed in fututre versions. Use fetchChannelItems(string) or fetchJSON and decodeData to fetch items instead.")
func fetchPosts(postIDs ids: [Int]) async -> [Item] {
    var items = [Item]();
    
    for id in ids {
        let data = await fetchData(url: baseUrl + "item/\(id).json")
        let item: Item = decodeData(json: data)
        items.append(item)
    }
    
    return items;
}

var sampleJSON = """
{
  "by" : "dhouston",
  "descendants" : 71,
  "id" : 8863,
  "kids" : [ 8952, 9224, 8917, 8884, 8887, 8943, 8869, 8958, 9005, 9671, 8940, 9067, 8908, 9055, 8865, 8881, 8872, 8873, 8955, 10403, 8903, 8928, 9125, 8998, 8901, 8902, 8907, 8894, 8878, 8870, 8980, 8934, 8876 ],
  "score" : 111,
  "time" : 1175714200,
  "title" : "My YC app: Dropbox - Throw away your USB drive",
  "type" : "story",
  "url" : "http://www.getdropbox.com/u/2/screencast.html"
}
"""
