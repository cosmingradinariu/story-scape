//
//  NewStoryView.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 15.04.2025.
//

import SwiftUI

struct NewStoryView: View {
    @Binding var stories: [Story]
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var genre = ""
    @State private var maxEntries = ""
    
    var body: some View {
        Form {
            Section(header: Text("New Story")) {
                TextField("Title", text: $title)
                TextField("Genre", text: $genre)
                TextField("Max Entries", text: $maxEntries)
                    .keyboardType(.numberPad)
            }
            Button("Create") {
                let newStory = Story(title: title, genre: genre, entries: [], maxEntries: Int(maxEntries) ?? 5)
                stories.append(newStory)
                dismiss()
            }
            .disabled(title.isEmpty || genre.isEmpty || Int(maxEntries) == nil)
        }
        .navigationTitle("Start a Story")
    }
}

#Preview {
    NewStoryView(stories: .constant([]))
}
