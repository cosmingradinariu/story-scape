//
//  SettingsView.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 26.04.2025.
//

import SwiftUI

struct SettingsView: View {
    @State var isDarkModeEnabled: Bool = true
    @State var downloadViaWifiEnabled: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Group {
                    HStack{
                        Spacer()
                        VStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width:100, height: 100, alignment: .center)
                                .foregroundStyle(.secondary)
                            Text("Caricioru")
                                .font(.title)
                            Text("caricioru@gmail.com")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            
                            Button(action: {
                                ///button action
                                print("cariceps")
                            }) {
                                Text("Edit Profile")
                                    .frame(minWidth: 0, maxWidth: 150)
                                    .font(.system(size: 16))
                                    .padding()
                                    .foregroundColor(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            .background(Color.blue.gradient)
                            .cornerRadius(25)
                        }
                        Spacer()
                    }
                }
                
                Section(header: Text("APPEARANCE"), content: {
                    NavigationLink(destination: Text("Themes")) {
                        ImageText(imageText: "paintpalette", text: "Theme")
                    }
                    
                    NavigationLink(destination: Text("Font style")) {
                        ImageText(imageText: "textformat", text: "Font style")
                    }
                    
                    NavigationLink(destination: Text("Font size")) {
                        ImageText(imageText: "textformat.size", text: "Font size")
                    }
                })
                
                Section(header: Text("NOTIFICATIONS"), content: {
                    NavigationLink(destination: Text("Themes")) {
                        ImageText(imageText: "arrow.counterclockwise.circle", text: "Notify on your turn")
                    }
                    NavigationLink(destination: Text("Themes")) {
                        ImageText(imageText: "person.badge.plus", text: "New story invite")
                    }
                    NavigationLink(destination: Text("Themes")) {
                        ImageText(imageText: "calendar", text: "Weekly story summary")
                    }
                })
                
                Section(header: Text("PRIVACY")) {
                    NavigationLink(destination: Text("Themes")) {
                        ImageText(imageText: "eye", text: "Profile visibility")
                    }
                    NavigationLink(destination: Text("Themes")) {
                        ImageText(imageText: "person.badge.plus", text: "Allow invitations")
                    }
                }
            }
            .navigationBarTitle("Settings")
            .listStyle(.insetGrouped)
            .safeAreaPadding(.bottom, 60)
        }
        
    }
}


#Preview {
    SettingsView()
}

