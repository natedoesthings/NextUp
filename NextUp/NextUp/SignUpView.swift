//
//  CategorySelectionView.swift
//  NextUp
//
//  Created by Yonatan Tussa on 12/22/24.
//
import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var acceptTerms: Bool = false
    @State private var currentStep: Double = 0.95
    
    var body: some View {
        VStack {
            ProgressView(value: currentStep, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()
                .tint(Color(hex: "#00B3FF"))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Finish creating your account.")
                    .font(.system(size:28, weight: .bold))
                    .foregroundColor(.black)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10)
                
                Text("Enter your details.")
                    .font(.system(size:15))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 50)
                
                // Name
                TextField("Name", text: $name)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "D3D3D3"), lineWidth: 1))
                    .padding(.bottom, 10)
                
                // Email
                TextField("Email Address", text: $email)
                    .padding()
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#D3D3D3"), lineWidth: 1))
                    .padding(.bottom, 10)
                
                // Password
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "D3D3D3"), lineWidth: 1))
                
                // Confirm Password
                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#D3D3D3"), lineWidth: 1))
                    .padding(.bottom, 20)
                
                // Terms and Conditions
                HStack {
                    Button(action: {
                        acceptTerms.toggle()
                    }) {
                        Image(systemName: acceptTerms ? "checkmark.square.fill" : "square")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(acceptTerms ? .blue : .gray)
                    }
                    Text("I've read and agree with the Terms and Conditions and Privacy Policy.")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 30)

                Spacer()
                
                NavigationLink(destination: DashboardView()) {
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
    SignUpView()
}
