//
//  LogInView.swift
//  BelyaevaDEMO
//
//  Created by user on 21.09.2024.
//

import SwiftUI

struct LogInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var checkBox: Bool = false
    
    @State private var isProgress: Bool = false
    @State private var isNavigate: Bool = false
    @State private var error: Bool = false
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5)
        {
            Spacer()
            Text("Welcome Back")
                .font(.system(size: 24))
                .padding(.bottom, 10)
            GrayText(value: "Fill in your email and password to continue")
                .padding(.bottom, 30)
            
            GrayText(value:"Email Address")
            GrayTextField(value: "***********@mail.com", name: $email)
            GrayText(value:"Password")
            GraySecureField(value: "********", text: $password)
            
            HStack
            {
                CheckBox(value: $checkBox, color: Color.darkGray)
                GrayText(value:"Remember password")
                Spacer()
                NavigationLink(destination: ForgotPasswordView()){Text("Forgot Password?")}
                    .font(.system(size: 14))
                    .foregroundColor(.primaryBlue)
            }
            Spacer()
            VStack(alignment: .center, spacing: 0)
            {
                Button("Log In") {
                    send()
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 150)
                .background(.darkGray)
                .foregroundColor(.white)
                .cornerRadius(5)
                .padding(.bottom, 20)
                .fontWeight(.bold)
                
                HStack{
                    GrayText(value:"Already have an account?")
                    NavigationLink(destination: SignUpView()) {Text("Sign Up")}
                        .font(.system(size: 14))
                        .foregroundColor(.primaryBlue)
                }
                .padding(.bottom, 20)
                GrayText(value:"or log in using")
                    .padding(.bottom, 10)
                Link(destination: URL(string: "https://www.figma.com")!) {Image("google")}
            }
            NavigationLink(destination: HomeView(), isActive: $isNavigate){}
        }
        .navigationBarHidden(true)
        .padding(20)
    }
    
    func send() {
        if checkBox {
            KeyChainManager.instance.savePassword(password: password)
        }
        
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                try await SupabaseManager.instance.signIn(email: email, password: password)
                
                
                await MainActor.run {
                    self.isNavigate = true
                    self.isProgress = false
                }
            } catch {
                print(error.localizedDescription)
                await MainActor.run {
                    self.error = true
                    self.isProgress = false
                }
            }
        }
    }
}

#Preview {
    LogInView()
}
