//
//  GrayText.swift
//  BelyaevaDEMO
//
//  Created by user on 21.09.2024.
//

import SwiftUI

struct GrayText: View {
    @State var value: String
    var body: some View {
        Text(value)
            .foregroundColor(.darkGray)
            .robotoFont(size: 14, weight: .black)
    }
}
