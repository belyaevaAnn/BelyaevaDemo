//
//  BoxTextField.swift
//  BelyaevaDEMO
//
//  Created by user on 21.09.2024.
//

import SwiftUI

struct BoxTextField: View {
    @Binding var text: String
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .padding(20)
            .border(Color.darkGray, width: 1)
            .frame(width: 40, height: 40)
            .overlay {
                TextField("", text: $text)
                    .robotoFont(size: 14, weight: .bold)
                    .padding(5)
                    .padding(.leading, 10)
            }
    }
}
