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
    @State private var isUserSignedUp = false
    @State private var userName: String = ""
    @State private var userEmail: String = ""

    var body: some View {
        ZStack {
            if showLoadingView {
                LoadingView()
                    .transition(.opacity)
                    .zIndex(1)
            } else if isUserSignedUp {
                DashboardView(userName: userName, userEmail: userEmail)
                    .transition(.opacity)
                    .zIndex(0)
            } else {
                ContentView()
                    .transition(.opacity)
                    .zIndex(0)
            }
        }
        .onAppear {
            loadUserDefaults()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showLoadingView = false
                }
            }
        }
    }
    
    func loadUserDefaults() {
            let defaults = UserDefaults.standard
            isUserSignedUp = defaults.bool(forKey: "isSignedUp")
            if isUserSignedUp {
                userName = defaults.string(forKey: "userName") ?? ""
                userEmail = defaults.string(forKey: "userEmail") ?? ""
            }
        }
    
}
