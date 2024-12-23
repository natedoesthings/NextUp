//
//  ContentView.swift
//  NextUp
//
//  Created by Yonatan Tussa on 12/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentImageIndex = 0
    
    let images = ["coding", "cooking", "painting"]
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
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
                    .frame(maxWidth: .infinity)
                    .frame(height: UIScreen.main.bounds.height * 0.6)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            ForEach(0..<images.count, id: \.self) { index in Circle()
                                    .fill(index == currentImageIndex ? Color(hex: "#00B3FF") : Color(hex: "#D3D3D3"))
                                    .frame(width: 10, height: 10)
                                    .padding(2)
                            }
                        }
                        
                        Text("Your path to mastery begins now.")
                            .font(.system(size:25, weight: .bold))
                            .foregroundColor(.black)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 10)
                        
                        Text("Learn a new skill, or take your existing skill to the next level.")
                            .font(.system(size:15))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 10)
                        
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
        }
    }
}

#Preview {
    ContentView()
}
