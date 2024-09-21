//
//  NewPasswordView.swift
//  BelyaevaDEMO
//
//  Created by user on 21.09.2024.
//

import SwiftUI

struct NewPasswordView: View {
    @State var password: String = ""
    @State var confPassword: String = ""
    
    @State private var isNavigate: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5)
        {
            Text("New Password")
                .font(.system(size: 24))
                .padding(.bottom, 10)
            GrayText(value: "Enter new password")
                .padding(.bottom, 60)
            
            GrayText(value:"Password")
            GraySecureField(value: "********", text: $password)
                .padding(.bottom, 10)
            GrayText(value:"Confirm Password")
            GraySecureField(value: "********", text: $confPassword)
                .padding(.bottom, 40)
            
            
            VStack(alignment: .center, spacing: 0)
            {
                Button("Log in") {
                    Send()
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 150)
                .background(.darkGray)
                .foregroundColor(.white)
                .cornerRadius(5)
                .padding(.bottom, 20)
                .fontWeight(.bold)
            }
        }
        .navigationBarHidden(true)
        .padding(20)
        .padding(.bottom, 130)
        
        NavigationLink(destination: HomeView(), isActive: $isNavigate){}
    }
    func Send()
    {
        if password == confPassword
        {
            self.isNavigate = true
        }
    }
}

#Preview {
    NewPasswordView()
}
