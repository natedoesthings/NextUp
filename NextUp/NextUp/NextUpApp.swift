//
//  NextUpApp.swift
//  NextUp
//
//  Created by Nathanael Tesfaye on 12/22/24.
//

import SwiftUI

@main
struct NextUpApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

struct MainView: View {
    @State private var showLoadingView = true

    var body: some View {
        ZStack {
            if showLoadingView {
                LoadingView()
                    .transition(.opacity)
                    .zIndex(1)
            } else {
                ContentView()
                    .transition(.opacity)
                    .zIndex(0)
            }
        }
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeInOut(duration:0.5)) {
                    showLoadingView = false
                }
            }
        }
    }
}
