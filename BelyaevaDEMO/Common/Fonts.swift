import Foundation
import SwiftUI

// расширение View
// дата создания: 21/09/2024
// автор: Беляева А.В.
extension View {
    
    // применение шрифта Roboto
    func robotoFont(size: CGFloat, weight: Font.Weight = .regular) -> some View {
        switch weight {
        case .bold:
            self
                .font(.custom("Roboto Bold", size: size))
        case .black:
            self
                .font(.custom("Roboto Black", size: size))
        case .medium:
            self
                .font(.custom("Roboto Medium", size: size))
        default:
            self
                .font(.custom("Roboto Regular", size: size))
        }
    }
}
