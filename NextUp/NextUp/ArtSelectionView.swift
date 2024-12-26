//
//  ArtSelectionView.swift
//  NextUp
//
//  Created by Yonatan Tussa on 12/25/24.
//

import SwiftUI

struct ArtSelectionView: View {
    @State private var selectedTopic: String? = nil
    @State private var currentStep: Double = 0.25
    @State private var specificInterest: String = ""
    
    @Environment(\.colorScheme) var colorScheme

    let topics = ["Drawing", "Painting", "Photography", "Graphic Design"]
    
    var body: some View {
        VStack {
            ProgressView(value: currentStep, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()
                .tint(Color(hex: "#00B3FF"))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Let's narrow things down.")
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10)
                
                Text("Select a specific topic you'd like to focus on.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 50)
                
                
                ForEach(topics, id: \.self) { topic in
                    Button(action: {
                        if selectedTopic == topic {
                            selectedTopic = nil
                            specificInterest = ""
                        } else {
                            selectedTopic = topic
                            specificInterest = topic
                        }
                    }) {
                        HStack {
                            Text(topic)
                                .font(.system(size: 18))
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            if selectedTopic == topic {
                                Image(systemName: "checkmark.circle.fill")
                                    //.foregroundColor(.white)
                                    .padding(.leading, 10)
                            }
                        }
                        .padding()
                        .background(
                            selectedTopic == topic ? Color.blue.opacity(0.2) : (colorScheme == .dark ? Color(hex: "#2D2D2D").opacity(0.3) : Color.white.opacity(0.3))
                        )
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hex: "#D3D3D3"), lineWidth: 1)
                        )
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Spacer()
                
                NavigationLink(destination: ExperienceSelectionView()) {
                    Text("Next")
                        .font(.system(size:15, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(specificInterest.isEmpty ? Color.gray : Color(hex: "#00B3FF"))
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                .simultaneousGesture(TapGesture().onEnded {
                    saveUserPreferences()
                })
                .disabled(specificInterest.isEmpty)
            }
            .padding()
        }
        //.background(Color.white)
    }
    
    func saveUserPreferences() {
        let defaults = UserDefaults.standard
        defaults.set(specificInterest, forKey: "specificInterest")

        // Debugging
        let savedInterest = UserDefaults.standard.string(forKey: "specificInterest") ?? "No Interest Selected"
        print("Saved specific interest: \(savedInterest)")
    }
}

#Preview {
    ArtSelectionView()
}
