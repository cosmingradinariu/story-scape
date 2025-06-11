//
//  Themes.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 04.05.2025.
//

import SwiftUI

struct Themes: View {
    @ObservedObject var viewModel: ThemeViewModel
    var body: some View {
        Form {
            Picker("Select Theme", selection: Binding(
                get: { viewModel.selectedTheme },
                set: { viewModel.selectedTheme = $0 }
            )) {
                ForEach(viewModel.allThemes) { theme in
                    Text(theme.rawValue).tag(theme)
                }
            }
            .pickerStyle(.inline)
        }
        .navigationTitle("Select Theme")
    }
}

#Preview {
    SettingsView()
}
