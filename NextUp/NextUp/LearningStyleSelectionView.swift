//
//  CategorySelectionView.swift
//  NextUp
//
//  Created by Yonatan Tussa on 12/22/24.
//
import SwiftUI

struct LearningStyleSelectionView: View {
    //@State private var selectedTopic: String? = nil
    @State private var currentStep: Double = 0.75
    @State private var learningStyle: [String] = []
    
    @Environment(\.colorScheme) var colorScheme
    
    let topics = ["Step-by-step instructions", "Hands-on projects", "Video tutorials", "Reading"]
    
    var body: some View {
        VStack {
            ProgressView(value: currentStep, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()
                .tint(Color(hex: "#00B3FF"))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("How do you prefer to learn?")
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10)
                
                Text("Choose the approaches that work for you, so we can match your style.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 50)
                
                
                ForEach(topics, id: \.self) { topic in
                    Button(action: {
                        if learningStyle.contains(topic) {
                            //selectedTopic = nil
                            if let index = learningStyle.firstIndex(of: topic) {
                                learningStyle.remove(at: index)
                            }
                        } else {
                            //selectedTopic = topic
                            learningStyle.append(topic)
                        }
                    }) {
                        HStack {
                            Text(topic)
                                .font(.system(size: 18))
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            if learningStyle.contains(topic) {
                                Image(systemName: "checkmark.circle.fill")
                                    //.foregroundColor(.white)
                                    .padding(.leading, 10)
                            }
                        }
                        .padding()
                        .background(
                            learningStyle.contains(topic) ? Color.blue.opacity(0.2) : (colorScheme == .dark ? Color(hex: "#2D2D2D").opacity(0.3) : Color.white.opacity(0.3))
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
                
                NavigationLink(destination: SignUpView()) {
                    Text("Next")
                        .font(.system(size:15, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(learningStyle.isEmpty ? Color.gray : Color(hex: "#00B3FF"))
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                .simultaneousGesture(TapGesture().onEnded {
                    saveUserPreferences()
                })
                .disabled(learningStyle.isEmpty)
            }
            .padding()
        }
        //.background(Color.white)
    }
    
    func saveUserPreferences() {
        let defaults = UserDefaults.standard
        defaults.set(learningStyle, forKey: "learningStyle")

        // Debugging
        let savedLearningStyle = UserDefaults.standard.array(forKey: "learningStyle") as? [String] ?? ["No Learning Style Selected"]
        print("Saved learning style: \(savedLearningStyle)")
    }
}

#Preview {
    LearningStyleSelectionView()
}
