//
//  ConfigurationManager.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import Foundation

final class ConfigurationManager {
    static let shared = ConfigurationManager()
    
    private init() {}
    
    var openWeatherAPIKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "OPENWEATHER_API_KEY") as? String else {
            fatalError("OpenWeather API key not found in Info.plist")
        }
        return key
    }
    
    var supabaseURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_URL") as? String else {
            fatalError("Supabase URL not found in Info.plist")
        }
        return url
    }
    
    var supabaseAnonKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_ANON_KEY") as? String else {
            fatalError("Supabase anon key not found in Info.plist")
        }
        return key
    }
}