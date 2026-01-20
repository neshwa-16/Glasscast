//
//  GlasscastApp.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//

import SwiftUI

@main
struct GlasscastApp: App {
    @StateObject private var authState = AuthState()
    
    var body: some Scene {
        WindowGroup {
            if authState.isAuthenticated {
                HomeView()
            } else {
                AuthView()
            }
        }
    }
}
