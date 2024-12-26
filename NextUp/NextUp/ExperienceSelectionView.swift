//
//  CategorySelectionView.swift
//  NextUp
//
//  Created by Yonatan Tussa on 12/22/24.
//
import SwiftUI

struct ExperienceSelectionView: View {
    @State private var selectedTopic: String? = nil
    @State private var currentStep: Double = 0.5
    @State private var experienceLevel: String = ""
    
    @Environment(\.colorScheme) var colorScheme

    let topics = ["Beginner", "Intermediate", "Advanced"]
    
    var body: some View {
        VStack {
            ProgressView(value: currentStep, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()
                .tint(Color(hex: "#00B3FF"))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Where are you starting?")
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10)
                
                Text("Choose the option that best matches your experience level.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 50)
                
                
                ForEach(topics, id: \.self) { topic in
                    Button(action: {
                        if selectedTopic == topic {
                            selectedTopic = nil
                            experienceLevel = ""
                        } else {
                            selectedTopic = topic
                            experienceLevel = topic
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
                
                NavigationLink(destination: LearningStyleSelectionView()) {
                    Text("Next")
                        .font(.system(size:15, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(experienceLevel.isEmpty ? Color.gray : Color(hex: "#00B3FF"))
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                .simultaneousGesture(TapGesture().onEnded {
                    saveUserPreferences()
                })
            }
            .padding()
        }
        //.background(Color.white)
    }
    
    func saveUserPreferences() {
        let defaults = UserDefaults.standard
        defaults.set(experienceLevel, forKey: "experienceLevel")

        // Debugging
        let savedExperienceLevel = UserDefaults.standard.string(forKey: "experienceLevel") ?? "No Experience Level Selected"
        print("Saved experience level: \(savedExperienceLevel)")
    }
}

#Preview {
    ExperienceSelectionView()
}
