//
//  StoryViewModel.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 17.06.2025.
//

import Foundation

class StoryViewModel: ObservableObject {
    @Published var item: DummyImage?
    
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
