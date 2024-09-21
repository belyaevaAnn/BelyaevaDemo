import Foundation
import Supabase

final class SupabaseManager {
    static let instance = SupabaseManager()
    private let users = "users"
    
    let supabase = SupabaseClient(
        supabaseURL: URL(string: "https://xqqmfnwdcwlxqsopivym.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhxcW1mbndkY3dseHFzb3BpdnltIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjY2MzEwMDgsImV4cCI6MjA0MjIwNzAwOH0.lU61M7WbYaHp_a4gogZbSVl8T_f8fn-m_yguKmFC7xE",
        options: .init()
    )
    func signUp(name: String, phone: String, email: String, password: String) async throws {
        try await supabase.auth.signUp(
            email: email,
            password: password)
        
        let user = try await supabase.auth.session.user
        
        let newUser = UserModel(id: user.id, name: name, phone: phone)
        
        try await supabase.from(users)
            .insert(newUser)
            .execute()
        
        try await supabase.auth.signOut()
    }
    func signIn(email: String, password: String) async throws {
        try await supabase.auth.signIn(email: email, password: password)
    }
}

