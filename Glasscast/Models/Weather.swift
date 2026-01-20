//
//  Weather.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import Foundation

struct Weather: Codable {
    let cod: Int?
    let message: Int?
    let cnt: Int?
    let list: [WeatherForecastItem]
}

struct WeatherForecastItem: Codable, Identifiable {
    var id = UUID()
    let dt: TimeInterval
    let main: Main
    let weather: [WeatherInfo]
    let wind: Wind
    let dt_txt: String
    
    struct Main: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let humidity: Int
    }
    
    struct WeatherInfo: Codable {
        let main: String
        let description: String
        let icon: String
    }
    
    struct Wind: Codable {
        let speed: Double
    }
}
