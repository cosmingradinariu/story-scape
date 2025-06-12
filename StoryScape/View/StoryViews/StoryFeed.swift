//
//  StoryFeed.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 15.04.2025.
//

import SwiftUI

struct StoryFeed: View {
    @State private var stories: [Story] = [
        Story(title: "The Forest Echo", genre: "Fantasy", description: "To stop Xcode’s SwiftUI preview from crashing every time, consider these targeted steps based on common causes and proven troubleshooting methods.", author: "Cosmin", entries: [
            StoryEntry(author: "Alice", content: "A soft whisper echoed through the trees."),
            StoryEntry(author: "Bob", content: "A glowing fox appeared in the clearing."),
            StoryEntry(author: "Cosmin", content: "Caricioru.")
        ], maxEntries: 5),
        Story(title: "The Forest Echo", genre: "Fantasy", description: "To stop Xcode’s SwiftUI preview from crashing every time, consider these targeted steps based on common causes and proven troubleshooting methods.", author: "Cosmin", entries: [
            StoryEntry(author: "Alice", content: "A soft whisper echoed through the trees."),
            StoryEntry(author: "Bob", content: "A glowing fox appeared in the clearing."),
            StoryEntry(author: "Cosmin", content: "Caricioru.")
        ], maxEntries: 5),
        Story(title: "The Forest Echo", genre: "Fantasy", description: "To stop Xcode’s SwiftUI preview from crashing every time, consider these targeted steps based on common causes and proven troubleshooting methods.", author: "Cosmin", entries: [
            StoryEntry(author: "Alice", content: "A soft whisper echoed through the trees."),
            StoryEntry(author: "Bob", content: "A glowing fox appeared in the clearing."),
            StoryEntry(author: "Cosmin", content: "Caricioru.")
        ], maxEntries: 5),
        Story(title: "The Forest Echo", genre: "Fantasy", description: "To stop Xcode’s SwiftUI preview from crashing every time, consider these targeted steps based on common causes and proven troubleshooting methods.", author: "Cosmin", entries: [
            StoryEntry(author: "Alice", content: "A soft whisper echoed through the trees."),
            StoryEntry(author: "Bob", content: "A glowing fox appeared in the clearing."),
            StoryEntry(author: "Cosmin", content: "Caricioru.")
        ], maxEntries: 5),
        Story(title: "The Forest Echo", genre: "Fantasy", description: "To stop Xcode’s SwiftUI preview from crashing every time, consider these targeted steps based on common causes and proven troubleshooting methods.", author: "Cosmin", entries: [
            StoryEntry(author: "Alice", content: "A soft whisper echoed through the trees."),
            StoryEntry(author: "Bob", content: "A glowing fox appeared in the clearing."),
            StoryEntry(author: "Cosmin", content: "Caricioru.")
        ], maxEntries: 5)
    ]
    @State private var activeTab: TabModel = .home
    @State private var isTabBarHidden: Bool = false
    
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack(alignment: .top) {
                    LazyVGrid(columns: columns) {
                        ForEach(stories) { story in
                            NavigationLink(destination: StoryView(story: story)) {
                                StoryCard(story: story)
                            }
                        }
                    }
                    
                    LazyVGrid(columns: columns) {
                        ForEach(stories) { story in
                            NavigationLink(destination: StoryView(story: story)) {
                                StoryCard(story: story)
                            }
                        }
                    }

                }
                .padding()
            }
            .buttonStyle(.plain)
            .navigationTitle("StoryScape")
            .toolbar {
                NavigationLink("New", destination: NewStoryView(stories: $stories))
            }
            .safeAreaPadding(.bottom, 60)
        }
    }
}


#Preview {
    StoryFeed()
}
