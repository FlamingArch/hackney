//
//  ExpandedComment.swift
//  hackney
//
//  Created by Harsh Chaturvedi on 13/08/21.
//

import SwiftUI

struct ExpandedComment: View {
    var text: String
    var by: String
    
    var body: some View {
        List {
            Section { Text(text).padding() }
           
        }.navigationTitle("By " + by).listStyle(InsetGroupedListStyle())
    }
}
