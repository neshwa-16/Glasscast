//
//  CurrentWeatherResponse.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


struct CurrentWeatherResponse: Decodable {
    let main: Main
    let weather: [Weather]
    let wind: Wind

    struct Main: Decodable {
        let temp: Double
        let temp_min: Double
        let temp_max: Double
        let humidity: Int
    }

    struct Weather: Decodable {
        let main: String
    }

    struct Wind: Decodable {
        let speed: Double
    }
}
