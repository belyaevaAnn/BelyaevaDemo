//
//  ForgotPasswordView.swift
//  BelyaevaDEMO
//
//  Created by user on 21.09.2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var email: String = ""
    
    @State private var isNavigate: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5)
        {
            Text("Forgot password")
                .font(.system(size: 24))
                .padding(.bottom, 10)
            GrayText(value: "Enter your email address")
                .padding(.bottom, 30)
            
            GrayText(value:"Email Address")
            GrayTextField(value: "***********@mail.com", name: $email)
                .padding(.bottom, 50)
            
            VStack(alignment: .center, spacing: 0)
            {
                Button("Send OTP") {
                    self.isNavigate = true
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 135)
                .background(.darkGray)
                .foregroundColor(.white)
                .cornerRadius(5)
                .padding(.bottom, 20)
                .fontWeight(.bold)
                
                HStack{
                    GrayText(value:"Remember password? Back to")
                    NavigationLink(destination: LogInView()) {Text("Sign in")}
                        .font(.system(size: 14))
                        .foregroundColor(.primaryBlue)
                }
            }
        }
        .navigationBarHidden(true)
        .padding(20)
        .padding(.bottom, 130)
        
        NavigationLink(destination: OTPVerificationView(), isActive: $isNavigate){}
        
    }
}
    
#Preview {
    ForgotPasswordView()
}
