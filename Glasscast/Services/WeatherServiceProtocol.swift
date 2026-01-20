//
//  WeatherServiceProtocol.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import Foundation

protocol WeatherServiceProtocol {
    func fetchCurrentWeather(latitude: Double, longitude: Double) async throws -> Weather
    func fetchForecast(latitude: Double, longitude: Double) async throws -> ForecastResponse
}

final class WeatherService: WeatherServiceProtocol {
    static let shared = WeatherService()
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient = .shared) {
        self.apiClient = apiClient
    }
    
    func fetchCurrentWeather(latitude: Double, longitude: Double) async throws -> Weather {
        let endpoint = WeatherEndpoint.current(lat: latitude, lon: longitude)
        let data = try await apiClient.requestData(from: endpoint)
        return try JSONDecoder().decode(Weather.self, from: data)
    }
    
    func fetchForecast(latitude: Double, longitude: Double) async throws -> ForecastResponse {
        let endpoint = WeatherEndpoint.forecast(lat: latitude, lon: longitude)
        let data = try await apiClient.requestData(from: endpoint)
        return try JSONDecoder().decode(ForecastResponse.self, from: data)
    }
}
