//
//  GraySecureField.swift
//  BelyaevaDEMO
//
//  Created by user on 21.09.2024.
//

import SwiftUI

struct GraySecureField: View {
    @State var value: String
    @Binding var text: String
    var body: some View {
        ZStack{
            SecureField(value, text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .robotoFont(size: 14, weight: .bold)
            HStack{
                Spacer()
                Image("eyeSlash")
                    .font(.system(size: 14))
                    .padding(.trailing, 5)
            }
        }
        .padding(.bottom, 15)
    }
}
