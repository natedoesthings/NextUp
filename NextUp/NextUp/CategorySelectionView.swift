//
//  CategorySelectionView.swift
//  NextUp
//
//  Created by Yonatan Tussa on 12/22/24.
//
import SwiftUI

struct CategorySelectionView: View {
    @State private var selectedTopic: String? = nil
    @State private var currentStep: Double = 0.00
    @State private var topInterest: String = ""
    
    @Environment(\.colorScheme) var colorScheme

    let topics = ["Programming", "Cooking", "Art", "Languages"]
    
    var body: some View {
        VStack {
            ProgressView(value: currentStep, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()
                .tint(Color(hex: "#00B3FF"))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("What would you like to learn?")
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10)
                
                Text("Choose your top interest.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 50)
                
                
                ForEach(topics, id: \.self) { topic in
                    Button(action: {
                        if selectedTopic == topic {
                            selectedTopic = nil
                            topInterest = ""
                        } else {
                            selectedTopic = topic
                            topInterest = topic
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
                
                NavigationLink(destination: nextView()) {
                    Text("Next")
                        .font(.system(size:15, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(topInterest.isEmpty ? Color.gray : Color(hex: "#00B3FF"))
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                .simultaneousGesture(TapGesture().onEnded {
                    saveUserPreferences()
                })
                .disabled(topInterest.isEmpty)
            }
            .padding()
        }
        //.background(Color.white)
    }
    
    @ViewBuilder
    private func nextView() -> some View {
        switch topInterest {
        case "Programming":
            ProgrammingSelectionView()
        case "Cooking":
            ExperienceSelectionView()
        case "Art":
            ArtSelectionView()
        case "Languages":
            LanguageSelectionView()
        default:
            EmptyView()
        }
    }
    
    func saveUserPreferences() {
        let defaults = UserDefaults.standard
        defaults.set(topInterest, forKey: "topInterest")
        
        // Removes specific interest if Cooking is selected
        // If no specific interest is specified, this will have no effect
        if topInterest == "Cooking" {
            defaults.removeObject(forKey: "specificInterest")
        }
        
        // Debugging
        let savedInterest = UserDefaults.standard.string(forKey: "topInterest") ?? "No Interest Selected"
        print("Saved top interest: \(savedInterest)")
    }
}

#Preview {
    CategorySelectionView()
}
