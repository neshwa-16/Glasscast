//
//  User.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import Foundation

struct User: Codable, Identifiable {
    let id: String
    let email: String
    let createdAt: Date
    var preferences: UserPreferences?
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case createdAt = "created_at"
        case preferences
    }
}

struct UserPreferences: Codable {
    var temperatureUnit: TemperatureUnit = .celsius
    var notificationsEnabled: Bool = true
}