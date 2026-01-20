//
//  ForecastResponse.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//

import Foundation

// MARK: - API Response
struct ForecastResponse: Codable {
    let list: [ForecastItem]
    let city: City
}

// MARK: - Forecast Item (3-hour interval)
struct ForecastItem: Codable {
    let dt: TimeInterval
    let main: Main
    let weather: [ForecastWeather]
    let wind: Wind
    let dt_txt: String
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Int
}

struct ForecastWeather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
}

struct City: Codable {
    let id: Int
    let name: String
    let country: String
}

// MARK: - Daily Summary Model
struct DailyForecast: Identifiable {
    let id = UUID()
    let date: Date
    let minTemp: Double
    let maxTemp: Double
    let condition: String
    let icon: String
}
