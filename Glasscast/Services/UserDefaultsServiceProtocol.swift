//
//  UserDefaultsServiceProtocol.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import Foundation

protocol UserDefaultsServiceProtocol {
    var temperatureUnit: TemperatureUnit { get set }
    var weatherAlertsEnabled: Bool { get set }
    var lastSyncDate: Date? { get set }
}

final class UserDefaultsService: UserDefaultsServiceProtocol {
    static let shared = UserDefaultsService()
    
    private let defaults = UserDefaults.standard
    
    private enum Keys {
        static let temperatureUnit = "temperatureUnit"
        static let weatherAlertsEnabled = "weatherAlertsEnabled"
        static let lastSyncDate = "lastSyncDate"
    }
    
    private init() {}
    
    var temperatureUnit: TemperatureUnit {
        get {
            guard let rawValue = defaults.string(forKey: Keys.temperatureUnit),
                  let unit = TemperatureUnit(rawValue: rawValue) else {
                return .celsius
            }
            return unit
        }
        set {
            defaults.set(newValue.rawValue, forKey: Keys.temperatureUnit)
        }
    }
    
    var weatherAlertsEnabled: Bool {
        get {
            // Default to true if not set
            if defaults.object(forKey: Keys.weatherAlertsEnabled) == nil {
                return true
            }
            return defaults.bool(forKey: Keys.weatherAlertsEnabled)
        }
        set {
            defaults.set(newValue, forKey: Keys.weatherAlertsEnabled)
        }
    }
    
    var lastSyncDate: Date? {
        get {
            defaults.object(forKey: Keys.lastSyncDate) as? Date
        }
        set {
            defaults.set(newValue, forKey: Keys.lastSyncDate)
        }
    }
}