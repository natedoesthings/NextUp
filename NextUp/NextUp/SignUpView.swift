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
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
    @State private var navigateToDashboard = false

    var isSubmitDisabled: Bool {
        return name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty || !acceptTerms
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ProgressView(value: currentStep, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle())
                        .padding()
                        .tint(Color(hex: "#00B3FF"))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Finish creating your account.")
                            .font(.title)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 10)
                        
                        Text("Enter your details.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 50)
                        
                        // Name
                        Text("Name")
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                        TextField("Name", text: $name)
                            .padding()
                        //.background(Color.white)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#D3D3D3"), lineWidth: 1))
                            .padding(.bottom, 10)
                        
                        // Email
                        Text("Email Address")
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                        // Workaround to keep email placeholder text from becoming blue
                        let at = "@"
                        TextField("", text: $email, prompt: Text("name\(at)email.com"))
                            .padding()
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        //.background(Color.white)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#D3D3D3"), lineWidth: 1))
                            .padding(.bottom, 10)
                        
                        // Password
                        Text("Password")
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                        SecureField("Create a password", text: $password)
                            .padding()
                        //.background(Color.white)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#D3D3D3"), lineWidth: 1))
                        
                        // Confirm Password
                        SecureField("Confirm password", text: $confirmPassword)
                            .padding()
                        //.background(Color.white)
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
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(acceptTerms ? Color(hex: "#00B3FF") : .gray)
                            }
                            Text("I've read and agree with the Terms and Conditions and Privacy Policy.")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom, 30)
                        
                        Spacer()
                        
                        Button(action: {
                            if validateInputs() {
                                saveUserDetails()
                                navigateToDashboard = true
                            }
                        }) {
                            Text("Submit")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(isSubmitDisabled ? Color.gray : Color(hex: "#00B3FF"))
                                .cornerRadius(10)
                        }
                        .disabled(isSubmitDisabled)
                        .padding(.top, 10)
                    }
                    .padding()
                }
                //.background(Color.white)
                .alert(isPresented: $showError) {
                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
                .navigationDestination(isPresented: $navigateToDashboard) {
                    DashboardView(userName: name, userEmail: email)
                }
                .navigationBarHidden(true)
            }
        }
        
    }
    
    func validateInputs() -> Bool {
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            errorMessage = "All fields are required."
            showError = true
            return false
        }
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            showError = true
            return false
        }
        guard acceptTerms else {
            errorMessage = "You must accept the terms and conditions."
            showError = true
            return false
        }
        return true
    }
        
    func saveUserDetails() {
        let defaults = UserDefaults.standard
        defaults.set(name, forKey: "userName")
        defaults.set(email, forKey: "userEmail")
        defaults.set(password, forKey: "userPassword")
        defaults.set(true, forKey: "isSignedUp")
    }
}

#Preview {
    SignUpView()
}
