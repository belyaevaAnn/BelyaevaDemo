import Foundation
import Crypto

// класс для работы KeyChain
// дата создания: 21/09/2024
// автор: Беляева А.В.
final class KeyChainManager {
    
    // паттерн instance
    static let instance = KeyChainManager()
    
    // метод - сохранение пароля в Keychain с хешированием SHA512
    func savePassword(password: String) {
        guard let passwordData = password.data(using: .utf8) else { return }
        
        let hashedPasswrd = SHA512.hash(data: passwordData)
        
        let formattedString = hashedPasswrd.compactMap({ String(format: "%02x", $0) }).joined()
        
        guard let formattedStringData = formattedString.data(using: .utf8) else { return }
        
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecValueData: formattedStringData
        ]
        
        SecItemAdd(query as CFDictionary, nil)
    }
}

