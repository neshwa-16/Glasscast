//
//  SupabaseAuthService.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//

import Foundation
import Supabase

final class SupabaseAuthService {
    static let shared = SupabaseAuthService()

    let client: SupabaseClient

    private init() {
        client = SupabaseClient(
            supabaseURL: URL(string: ConfigurationManager.shared.supabaseURL)!,
            supabaseKey: ConfigurationManager.shared.supabaseAnonKey
        )
    }
}
