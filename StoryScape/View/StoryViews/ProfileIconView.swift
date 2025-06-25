//
//  ProfileIconView.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 25.06.2025.
//

import SwiftUI

struct ProfileIconView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 22, height: 22)
                .foregroundStyle(.blue)
            HStack(spacing: 0) {
                Text("C")
                Text("G")
            }
            .font(.caption2)
            .foregroundStyle(.white)
            .clipped()
        }
    }
}

#Preview {
    ProfileIconView()
}
