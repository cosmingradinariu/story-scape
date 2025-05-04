//
//  Text+Image.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 04.05.2025.
//

import SwiftUI

struct ImageText: View {
    var imageText: String
    var text: String
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: imageText)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                //.padding(.trailing, 3)
            Text(text)
        }
    }
}

#Preview {
    ImageText(imageText: "heart", text: "Favorite")
}

extension VerticalAlignment {
    struct ImageAndText: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.trailing]
        }
    }
    
    static let textAndImage = VerticalAlignment(ImageAndText.self)
}
