//
//  StoryScapeApp.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 08.04.2025.
//

import SwiftUI

@main
struct StoryScapeApp: App {
    @StateObject private var themeViewModel = ThemeViewModel()
    
    var body: some Scene {
           WindowGroup {
               ContentView()
                   .environmentObject(themeViewModel)
                   .environmentObject(TabBarState())
                   .preferredColorScheme(themeViewModel.selectedTheme == .system ? nil : themeViewModel.selectedTheme == .light ? .light : .dark)
           }
       }
}
