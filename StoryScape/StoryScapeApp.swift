//
//  StoryScapeApp.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 08.04.2025.
//

import SwiftUI

@main
struct StoryScapeApp: App {
    @AppStorage("selectedTheme") private var selectedThemeRawValue: String = AppTheme.system.rawValue
    
    var body: some Scene {
           WindowGroup {
               let selectedTheme = AppTheme(rawValue: selectedThemeRawValue) ?? .system
               if selectedTheme == .system {
                   ContentView()
               } else {
                   ContentView()
                       .preferredColorScheme(selectedTheme == .light ? .light : .dark)
               }
           }
       }
}
