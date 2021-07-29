//
//  ItemModel.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 02/06/21.
//

import Foundation

enum HNItemType: String, Codable {
    case job,
         story,
         comment,
         poll,
         pollopt
}

struct HNItem: Decodable {
    
    /**
     # Hacker News Item
     _For more information about Hacker News API, visit: [https://github.com/HackerNews/API]_
     | Field |    Description |
     |---|----|
     | id |    The item's unique id. |
     | deleted |    true if the item is deleted. |
     | type |    The type of item. One of "job", "story", "comment", "poll", or "pollopt". |
     | by |    The username of the item's author. |
     | time |    Creation date of the item, in Unix Time. |
     | text |    The comment, story or poll text. HTML. |
     | dead |    true if the item is dead. |
     | parent |    The comment's parent: either another comment or the relevant story. |
     | poll |    The pollopt's associated poll. |
     | kids |    The ids of the item's comments, in ranked display order. |
     | url |    The URL of the story. |
     | score |    The story's score, or the votes for a pollopt. |
     | title |    The title of the story, poll or job. HTML. |
     | parts |    A list of related pollopts, in display order. |
     | descendants |    In the case of stories or polls, the total comment count. |
     |----|----|
     
     */
    
    /// The item's unique id.
    var id: Int
    
    /// true if the item is deleted.
    var deleted: Bool?
    
    /// The type of item. One of "job", "story", "comment", "poll", or "pollopt".
    //    var type: HNItemType
    var type: String
    
    /// The username of the item's author.
    var by: String?
    
    /// Creation date of the item, in Unix Time.
    //    var time: Int?
    //    var normalTime: Date {
    //        guard let unwrappedUnixTime = time else {
    //            return Date()
    //        }
    //        return Date(timeIntervalSince1970: TimeInterval(unwrappedUnixTime))
    //    }
    
    /// The comment, story or poll text. HTML.
    var text: String?
    
    /// true if the item is dead.
    var dead: Bool?
    
    /// The comment's parent: either another comment or the relevant story.
    var parent: Int?
    
    /// The pollopt's associated poll.
    var poll: Int?
    
    /// The ids of the item's comments, in ranked display order.
    var kids: [Int]?
    
    /// The URL of the story
    var url: String?
    
    /// The story's score, or the votes for a pollopt.
    var score: Int?
    
    /// The title of the story, poll or job. HTML.
    var title: String?
    
    /// A list of related pollopts, in display order.
    var parts: [Int]?
    
    /// In the case of stories or polls, the total comment count
    var descendants: Int?
    
}
