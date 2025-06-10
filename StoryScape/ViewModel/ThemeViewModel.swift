//
//  ThemeViewModel.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 27.05.2025.
//

import SwiftUI

class ThemeViewModel: ObservableObject {
    @AppStorage("selectedTheme") private var selectedThemeRawValue: String = AppTheme.system.rawValue

    var selectedTheme: AppTheme {
        get { AppTheme(rawValue: selectedThemeRawValue) ?? .system }
        set { selectedThemeRawValue = newValue.rawValue }
    }

    var allThemes: [AppTheme] {
        AppTheme.allCases
    }
}
