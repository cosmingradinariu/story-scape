//
//  StoryCard.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 11.06.2025.
//

import SwiftUI

struct StoryCard: View {
    @State private var dogImage: DummyImage?
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
        .task {
            do {
                dogImage = try await getImage()
            } catch {
                print("Error")
            }
        }
    }
    
    func getImage() async throws -> DummyImage {
        let endpoint = "https://dog.ceo/api/breeds/image/random"
        guard let url = URL(string: endpoint) else { throw DummyError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw DummyError.invalidURL
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(DummyImage.self, from: data)
        } catch {
            throw DummyError.invalidData
        }
    }
}

#Preview {
    StoryCard(story: Story.dummyStory)
}

struct DummyImage: Codable {
    let message: String
}

enum DummyError: Error {
    case invalidURL
    case invalidData
}
