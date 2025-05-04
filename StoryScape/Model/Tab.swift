//
//  Tab.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 22.04.2025.
//

import Foundation

enum TabModel: String, CaseIterable {
    case home = "house"
    case search = "magnifyingglass"
    case notifications = "bell"
    case settings = "gearshape"
    
    var title: String {
        switch self {
        case .home: "Home"
        case .search: "Search"
        case .notifications: "Notifications"
        case .settings: "Settings"
        }
    }
}
