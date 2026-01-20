//
//  SettingsViewModel.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import Foundation

@MainActor
final class SettingsViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var temperatureUnit: TemperatureUnit = .celsius
    @Published var weatherAlertsEnabled: Bool = true
    @Published var userEmail: String = ""
    @Published var authStatus: String = "Not Authenticated"
    @Published var lastSyncTime: String = "Never"
    @Published var showSignOutConfirmation = false
    
    // MARK: - Dependencies
    private let authService: AuthServiceProtocol
    private let databaseService: DatabaseServiceProtocol
    private var userDefaultsService: UserDefaultsServiceProtocol
    
    // MARK: - Initialization
    init(
        authService: AuthServiceProtocol = AuthService.shared,
        databaseService: DatabaseServiceProtocol = DatabaseService.shared,
        userDefaultsService: UserDefaultsServiceProtocol = UserDefaultsService.shared
    ) {
        self.authService = authService
        self.databaseService = databaseService
        self.userDefaultsService = userDefaultsService
    }
    
    // MARK: - Public Methods
    func loadSettings() async {
        // Load temperature unit
        temperatureUnit = userDefaultsService.temperatureUnit
        
        // Load weather alerts setting
        weatherAlertsEnabled = userDefaultsService.weatherAlertsEnabled
        
        // Load user info
        if let user = authService.currentUser {
            userEmail = user.email ?? ""
            authStatus = "Supabase Authenticated"
        }
        
        // Load last sync time
        if let lastSync = userDefaultsService.lastSyncDate {
            lastSyncTime = formatSyncTime(lastSync)
        }
    }
    
    func signOut() {
        showSignOutConfirmation = true
    }
    
    func confirmSignOut() async {
        do {
            try await authService.signOut()
            // Navigation handled by parent view observing auth state
        } catch {
            print("Sign out failed: \(error)")
        }
    }
    
    // MARK: - Private Methods
    private func formatSyncTime(_ date: Date) -> String {
        let now = Date()
        let interval = now.timeIntervalSince(date)
        
        if interval < 60 {
            return "Synced just now"
        } else if interval < 3600 {
            let minutes = Int(interval / 60)
            return "Synced \(minutes)m ago"
        } else if interval < 86400 {
            let hours = Int(interval / 3600)
            return "Synced \(hours)h ago"
        } else {
            let days = Int(interval / 86400)
            return "Synced \(days)d ago"
        }
    }
}

// MARK: - Observer Pattern for Settings Changes
extension SettingsViewModel {
    func observeTemperatureUnit() {
        // Update UserDefaults when temperature unit changes
        Task {
            for await unit in $temperatureUnit.values {
                userDefaultsService.temperatureUnit = unit
            }
        }
    }
    
    func observeWeatherAlerts() {
        // Update UserDefaults when weather alerts toggle changes
        Task {
            for await enabled in $weatherAlertsEnabled.values {
                userDefaultsService.weatherAlertsEnabled = enabled
            }
        }
    }
}
