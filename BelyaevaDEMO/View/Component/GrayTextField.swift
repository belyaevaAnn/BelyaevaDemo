//
//  GrayTextField.swift
//  BelyaevaDEMO
//
//  Created by user on 21.09.2024.
//

import SwiftUI

struct GrayTextField: View {
    @State var value: String
    @Binding var name: String
    var body: some View {
        TextField(value, text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.bottom, 15)
            .robotoFont(size: 14, weight: .bold)
    }
}
