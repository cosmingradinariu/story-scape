//
//  AppTheme.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 27.05.2025.
//

import Foundation

enum AppTheme: String, CaseIterable, Identifiable {
    case light = "Light"
    case dark = "Dark"
    case system = "Automatic"
    
    var id: String { self.rawValue }
}
