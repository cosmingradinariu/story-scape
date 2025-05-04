//
//  Story.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 14.04.2025.
//

import Foundation

struct StoryEntry: Identifiable {
    var id = UUID()
    var author: String
    var content: String
}

struct Story: Identifiable {
    let id = UUID()
    let title: String
    let genre: String
    var entries: [StoryEntry]
    let maxEntries: Int
}
