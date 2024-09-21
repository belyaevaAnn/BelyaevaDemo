//
//  OTPVerificationView.swift
//  BelyaevaDEMO
//
//  Created by user on 21.09.2024.
//

import SwiftUI

struct OTPVerificationView: View {
    @State private var isNavigate: Bool = false
    
    @State var one: String = ""
    @State var two: String = ""
    @State var three: String = ""
    @State var thour: String = ""
    @State var five: String = ""
    @State var six: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5)
        {
            Text("OTP Verification")
                .font(.system(size: 24))
                .padding(.bottom, 10)
            GrayText(value: "Enter the 6 digit numbers sent to your email")
                .padding(.bottom, 70)
            
            HStack(alignment: .center, spacing: 22)
            {
                BoxTextField(text: $one)
                BoxTextField(text: $two)
                BoxTextField(text: $three)
                BoxTextField(text: $thour)
                BoxTextField(text: $five)
                BoxTextField(text: $six)
            }
            
            VStack(alignment: .center, spacing: 30)
            {
                HStack{
                    GrayText(value:"If you didn′t receive code,")
                    NavigationLink(destination: OTPVerificationView()) {Text("resend")}
                        .font(.system(size: 14))
                        .foregroundColor(.primaryBlue)
                }
                Button("Set New Password") {
                    self.isNavigate = true
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 100)
                .background(.darkGray)
                .foregroundColor(.white)
                .cornerRadius(5)
                .padding(.top, 50)
                .fontWeight(.bold)
            }
        }
        .navigationBarHidden(true)
        .padding(20)
        .padding(.bottom, 130)
        
        NavigationLink(destination: NewPasswordView(), isActive: $isNavigate){}
    }
}

#Preview {
    OTPVerificationView()
}
