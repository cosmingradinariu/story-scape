//
//  StoryCard.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 11.06.2025.
//

import SwiftUI

struct StoryCard: View {
    @State private var dogImage: DummyImage?
    @StateObject var viewModel = StoryViewModel()
    var story: Story
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: dogImage?.message ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipped()
            } placeholder: {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.secondary)
            }
                
            HStack {
                VStack(alignment: .leading, spacing: 15) {
                    Text(story.title)
                        .font(.headline)
                        .fontWeight(.medium)
                        .padding(.top, -5)
                        .padding(.bottom, 5)
                        .foregroundStyle(.primary)
                    
                    Text(story.description ?? "No description available.")
                        .lineLimit(2)
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 10)
                    
                    HStack {
                        Text(story.genre)
                            .font(.caption2)
                            .foregroundStyle(.blue.gradient)
                        
                        Spacer()
                        ///instead of created by, show a circle image profile with the user's profile pic. if the user doesn't have a profile pic, show initials if he has first and last name, one initial if he has only first/last name.
                        ///if the user doesn't have an account show something different from those above (question mark in a circle).
//                        Text("Created by " + (story.author ?? "Anonymous"))
//                            .font(.caption2)
//                            .foregroundStyle(.tertiary)
                        ProfileIconView()
                    }
                }
                .padding()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black.opacity(0.2), lineWidth: 1)
                .shadow(radius: 5, x: 0, y: 10)
        }///to remove this and include in a viewModel or something
        .task {
            do {
                dogImage = try await viewModel.getImage()
            } catch {
                print("Error")
            }
        }
    }
}

#Preview {
    StoryCard(story: Story.dummyStory)
}

