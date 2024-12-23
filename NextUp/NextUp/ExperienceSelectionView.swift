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
    
    let topics = ["Beginner", "Intermediate", "Advanced"]
    
    var body: some View {
        VStack {
            ProgressView(value: currentStep, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()
                .tint(Color(hex: "#00B3FF"))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Where are you starting?")
                    .font(.system(size:28, weight: .bold))
                    .foregroundColor(.black)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10)
                
                Text("Choose the option that best matches your experience level.")
                    .font(.system(size:15))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 50)
                
                
                ForEach(topics, id: \.self) { topic in
                    Button(action: {
                        if selectedTopic == topic {
                            selectedTopic = nil
                        } else {
                            selectedTopic = topic
                        }
                    }) {
                        HStack {
                            Text(topic)
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            if selectedTopic == topic {
                                Image(systemName: "checkmark.circle.fill")
                                    //.foregroundColor(.white)
                                    .padding(.leading, 10)
                            }
                        }
                        .padding()
                        .background(
                            selectedTopic == topic ? Color.blue.opacity(0.2) : Color.white.opacity(0.3)
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
                        .background(Color(hex: "#00B3FF"))
                        .cornerRadius(10)
                }
                .padding(.top, 10)
            }
            .padding()
        }
        .background(Color.white)
    }
}

#Preview {
    ExperienceSelectionView()
}
