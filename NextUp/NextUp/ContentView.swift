//
//  ContentView.swift
//  NextUp
//
//  Created by Yonatan Tussa on 12/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentImageIndex = 0
    
    @Environment(\.colorScheme) var colorScheme
    
    let images = ["coding", "cooking", "painting"]
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    GeometryReader { geometry in
                        TabView(selection: $currentImageIndex) {
                            ForEach(0..<images.count, id: \.self) { index in
                                Image(images[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width)
                                    .clipped()
                                    .tag(index)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .animation(.easeInOut, value: currentImageIndex)
                        .onReceive(timer) { _ in
                            withAnimation {
                                currentImageIndex = (currentImageIndex + 1) % images.count
                            }
                        }
                        .edgesIgnoringSafeArea(.top)
                    }
                    //.frame(maxWidth: .infinity)
                    .frame(height: UIScreen.main.bounds.height * 0.6)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            ForEach(0..<images.count, id: \.self) { index in Circle()
                                    .fill(index == currentImageIndex ? Color(hex: "#00B3FF") : (colorScheme == .dark ? Color(hex: "#2D2D2D") : Color(hex: "#D3D3D3")))
                                    .frame(width: 10, height: 10)
                                    .padding(2)
                            }
                        }
                        
                        Text("Your path to mastery begins now.")
                            .font(.title)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 5)
                        
                        Text("Learn a new skill, or take your existing skills to the next level.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 5)
                        
                        NavigationLink(destination: CategorySelectionView()) {
                            Text("Next")
                                .font(.system(size:15, weight: .semibold))
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(hex: "#00B3FF"))
                                .cornerRadius(10)
                        }
                        .padding(.top, 10)
                    }
                    .padding()
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
