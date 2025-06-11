//
//  StoryCard.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 11.06.2025.
//

import SwiftUI

struct StoryCard: View {
    var story: Story
    var dummyImages = ["flamingos", "blue_image", "green_image"]
    var body: some View {
        VStack {
            Image(dummyImages.randomElement() ?? "flamingos")
                .resizable()
                .scaledToFit()
                .clipped()
            HStack {
                VStack(alignment: .leading) {
                    
                    Text(story.title)
                        .font(.title3)
                        .fontWeight(.medium)
                        .padding(.top, -10)
                        .padding(.bottom, 5)
                        .foregroundStyle(.primary)
                    
                    Text(story.description ?? "No description available.")
                        .lineLimit(2)
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 10)
                    
                    HStack {
                        Text(story.genre)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Text("Created by " + (story.author ?? "Anonymous"))
                            .font(.caption2)
                            .foregroundStyle(.tertiary)
                    }
                }
                .padding()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                .shadow(radius: 4, x: 0, y: 4)
        }
        .padding()
    }
}

#Preview {
    StoryCard(story: Story.dummyStory)
}
