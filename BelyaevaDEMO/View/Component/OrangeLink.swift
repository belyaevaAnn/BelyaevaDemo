//
//  OrangeLink.swift
//  BelyaevaDEMO
//
//  Created by user on 21.09.2024.
//

import SwiftUI

struct OrangeLink: View {
    @State var value: String
    @State var ur: String = "https://www.figma"
    var body: some View {
        Link(destination: URL(string: ur)!) {Text(value)}
            .foregroundColor(.secondaryOrange)
            .robotoFont(size: 14, weight: .bold)
    }
}
