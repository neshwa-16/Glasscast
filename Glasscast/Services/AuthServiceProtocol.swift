//
//  AuthServiceProtocol.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//

import Foundation
import Supabase

protocol AuthServiceProtocol {
    var isAuthenticated: Bool { get }
    var currentUser: Supabase.User? { get }
    func signIn(email: String, password: String) async throws
    func signOut() async throws
}

final class AuthService: AuthServiceProtocol {
    static let shared = AuthService()
    
    let client: SupabaseClient
    
    private init() {
        client = SupabaseClient(
            supabaseURL: URL(string: ConfigurationManager.shared.supabaseURL)!,
            supabaseKey: ConfigurationManager.shared.supabaseAnonKey
                )
    }
    
    var isAuthenticated: Bool {
        client.auth.currentSession != nil
    }
    
    var currentUser: Supabase.User? {
            client.auth.currentUser
        }
    
    func signIn(email: String, password: String) async throws {
            try await client.auth.signIn(
                email: email,
                password: password
            )
        }

        func signOut() async throws {
            try await client.auth.signOut()
        }
}
