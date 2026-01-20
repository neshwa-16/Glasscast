//
//  AuthState.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//

import Foundation
import Supabase

@MainActor
final class AuthState: ObservableObject {
    @Published var isAuthenticated = false

    private let client = AuthService.shared.client

    init() {
        Task {
            for await state in client.auth.authStateChanges {
                self.isAuthenticated = state.session != nil
            }
        }
    }
}

