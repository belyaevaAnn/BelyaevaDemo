//
//  SignUpView.swift
//  BelyaevaDEMO
//
//  Created by user on 21.09.2024.
//

import SwiftUI

struct SignUpView: View {
    @State var name: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confPassword: String = ""
    @State private var checkBox: Bool = false
    
    @State private var isProgress: Bool = false
    @State var isNavigate: Bool = false
    @State private var error: Bool = false
    
    var body: some View {
        NavigationView
        {
            VStack(alignment: .leading, spacing: 5)
            {
                Text("Create an account")
                    .robotoFont(size: 24, weight: .bold)
                    .padding(.bottom, 10)
                GrayText(value: "Complete the sign up process to get started")
                    .padding(.bottom, 30)
                GrayText(value:"Full name")
                    .fontWeight(.bold)
                GrayTextField(value: "Ivanov Ivan", name: $name)
                GrayText(value:"Phone number")
                    .fontWeight(.bold)
                GrayTextField(value: "+7(999)999-99-99", name: $phone)
                GrayText(value:"Email Address")
                    .fontWeight(.bold)
                GrayTextField(value: "***********@mail.com", name: $email)
                GrayText(value:"Password")
                    .fontWeight(.bold)
                
                GraySecureField(value: "********", text: $password)
                GrayText(value:"Confirm Password")
                    .fontWeight(.bold)
                
                GraySecureField(value: "********", text: $confPassword)
                    .padding(.bottom, 20)
                VStack(alignment: .center, spacing: 0){
                    HStack{
                        CheckBox(value: $checkBox)
                        GrayText(value:"By ticking this box, you agree to our")
                        OrangeLink(value: "Terms and")
                    }
                    
                    OrangeLink(value: "conditions and private policy")
                        .padding(.bottom, 40)
                    Button("Sign Up") {
                        Send()
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 140)
                    .background(.darkGray)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .padding(.bottom, 20)
                    .fontWeight(.bold)
                    .robotoFont(size: 16, weight: .black)
                    
                    HStack{
                        GrayText(value:"Already have an account?")
                        NavigationLink(destination: LogInView()) {Text("Sign in")}
                            .font(.system(size: 14))
                            .foregroundColor(.primaryBlue)
                    }
                    .padding(.bottom, 20)
                    GrayText(value:"or sign in using")
                        .padding(.bottom, 10)
                    Link(destination: URL(string: "https://www.figma.com")!) {Image("google")}
                    
                }
                NavigationLink(destination: LogInView(), isActive: $isNavigate){}
            }
            .navigationBarBackButtonHidden(true)
            .padding(20)
        }
    }
    
    func Send()
    {
        if password == confPassword && checkBox
        {
            Task
            {
                do
                {
                    await MainActor.run {
                        self.isProgress = true
                    }
                    try await SupabaseManager.instance.signUp(name: name, phone: phone, email: email, password: password)
                    await MainActor.run {
                        self.isNavigate = true
                        self.isProgress = false
                    }
                } catch {
                    print("ERROR: " + error.localizedDescription)
                    await MainActor.run {
                        self.error = true
                        self.isProgress = false
                    }
                }
            }
        }
        
    }
}

#Preview {
    SignUpView()
}
