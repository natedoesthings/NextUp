//
//  ContentView.swift
//  NextUp
//
//  Created by Nathanael Tesfaye on 12/22/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color(hex: "#00B3FF")]), startPoint: .topLeading, endPoint: .center)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("NextUpLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 2000)
                    .padding(220)
            }
        }
    }
}

#Preview {
    LoadingView()
}
