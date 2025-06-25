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
    let description: String?
    let author: String?
    var entries: [StoryEntry]
    let maxEntries: Int
    
    static let dummyStory: Story = .init(title: "The Forest Echo", genre: "Fantasy", description: "To stop Xcode’s SwiftUI preview from crashing every time, consider these targeted steps based on common causes and proven troubleshooting methods.", author: "Cosmin", entries: [
        StoryEntry(author: "Alice", content: "A soft whisper echoed through the trees."),
        StoryEntry(author: "Bob", content: "A glowing fox appeared in the clearing."),
        StoryEntry(author: "Cosmin", content: "Caricioru.")
    ], maxEntries: 5)
}

struct DummyImage: Codable {
    let message: String
}

enum DummyError: Error {
    case invalidURL
    case invalidData
}
