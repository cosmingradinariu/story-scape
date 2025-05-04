//
//  hiding.swift
//  StoryScape
//
//  Created by Cosmin Gradinariu on 26.04.2025.
//

import SwiftUI


struct hiding: View {
    var body: some View {
        NavigationStack {
            TabView {
                ScrollableView()
            }
            .navigationTitle("Demo")
        }
        
    }
}

struct ScrollableView: View {
    @State var isHiding : Bool = false
    @State var scrollOffset : CGFloat = 0
    @State var threshHold : CGFloat = 0
    var body: some View {
        ScrollView {
            ZStack {
                LazyVStack {
                    ForEach(0..<300) { _ in
                        ScrollItem()
                    }
                }
                GeometryReader { proxy in
                    Color.clear
                        .changeOverlayOnScroll(
                            proxy: proxy,
                            offsetHolder: $scrollOffset,
                            thresHold: $threshHold,
                            toggle: $isHiding
                        )
                }
            }
        }
        .coordinateSpace(name: "scroll")
        .toolbar(isHiding ? .hidden : .visible, for: .navigationBar)
        .toolbar(isHiding ? .hidden : .visible, for: .tabBar)
        
    }
    
    
 // ScrollChild
struct ScrollItem: View {
        var body: some View {
            Rectangle()
                .fill(Color.red)
                .frame(minHeight: 200)
        }
    }
}

extension View {
    
    func changeOverlayOnScroll(
        proxy : GeometryProxy,
        offsetHolder : Binding<CGFloat>,
        thresHold : Binding<CGFloat>,
        toggle: Binding<Bool>
    ) -> some View {
        self
            .onChange(
                of: proxy.frame(in: .named("scroll")).minY
            ) { newValue in
                // Set current offset
                offsetHolder.wrappedValue = abs(newValue)
                // If current offset is going downward we hide overlay after 200 px.
                if offsetHolder.wrappedValue > thresHold.wrappedValue + 150 {
                    // We set thresh hold to current offset so we can remember on next iterations.
                    thresHold.wrappedValue = offsetHolder.wrappedValue
                    // Hide overlay
                    toggle.wrappedValue = true
                    
                    // If current offset is going upward we show overlay again after 200 px
                }else if offsetHolder.wrappedValue < thresHold.wrappedValue - 150 {
                    // Save current offset to threshhold
                    thresHold.wrappedValue = offsetHolder.wrappedValue
                    // Show overlay
                    toggle.wrappedValue = false
                }
         }
    }
}

#Preview {
    hiding()
}
