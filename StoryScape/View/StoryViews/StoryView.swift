//
//  StoryView.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 15.04.2025.
//

import SwiftUI

struct StoryView: View {
    @State var story: Story
    @State private var newEntry: String = ""
    /// if user has account display his name if not, display Anonymous.
    @State private var authorName: String = ""
    
    @EnvironmentObject var tabBarState: TabBarState
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(story.entries) { entry in
                    LazyVStack(alignment: .leading, spacing: 4) {
                        Text(entry.author).font(.caption).foregroundColor(.secondary)
                        Text(entry.content).padding(6)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                    .padding(.bottom, 6)
                }
            }
            
            if story.entries.count < story.maxEntries {
                VStack(spacing: 8) {
                    TextField("Your name", text: $authorName)
                        .textFieldStyle(.roundedBorder)
                    TextField("Write your part...", text: $newEntry, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(5)
                    Button("Submit Entry") {
                        guard !newEntry.isEmpty else { return }
                        if authorName.isEmpty {
                            authorName = "Anonymous"
                        }
                        let entry = StoryEntry(author: authorName, content: newEntry)
                        story.entries.append(entry)
                        newEntry = ""
                        authorName = ""
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            } else {
                Text("Story complete 🎉").padding()
            }
        }
        .padding()
        .navigationTitle(story.title)
        .onAppear { tabBarState.isTabBarHidden = true }
        .onDisappear { tabBarState.isTabBarHidden = false }
    }
}


#Preview {
    StoryView(story: Story.dummyStory)
}

