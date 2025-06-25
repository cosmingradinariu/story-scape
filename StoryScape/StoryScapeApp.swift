//
//  StoryScapeApp.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 08.04.2025.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct StoryScapeApp: App {
    ///register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
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
