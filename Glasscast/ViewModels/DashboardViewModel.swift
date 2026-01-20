//
//  DashboardViewModel.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import Foundation

@MainActor
final class DashboardViewModel: ObservableObject {

    // MARK: - Published Properties
    @Published var locationName: String = "Current Location"
    @Published var currentTemperature: Double = 0
    @Published var weatherCondition: String = "--"
    @Published var highTemp: Int = 0
    @Published var lowTemp: Int = 0
    @Published var windSpeed: Int = 0
    @Published var humidity: Int = 0
    @Published var precipitation: Int = 0
    @Published var forecast: [ForecastDay] = []

    @Published var isLoading = false
    @Published var errorMessage: String?

    @Published var showProfile = false
    @Published var showSettings = false
    @Published var showFullForecast = false

    // MARK: - Dependencies
    private let weatherService: WeatherServiceProtocol
    private let locationService: LocationServiceProtocol

    // MARK: - Init
    init(
        weatherService: WeatherServiceProtocol = WeatherService.shared,
        locationService: LocationServiceProtocol = LocationService.shared
    ) {
        self.weatherService = weatherService
        self.locationService = locationService
    }

    // MARK: - Public Methods
    func fetchWeather() async {
        isLoading = true
        errorMessage = nil

        do {
            let location = try await locationService.getCurrentLocation()
            locationName = location.name

            async let currentWeather = weatherService.fetchCurrentWeather(
                latitude: location.latitude,
                longitude: location.longitude
            )

            async let forecastResponse = weatherService.fetchForecast(
                latitude: location.latitude,
                longitude: location.longitude
            )

            let (weather, forecastData) = try await (currentWeather, forecastResponse)

            updateWeatherData(weather)
            updateForecast(forecastData)

        } catch {
            print("❌ Weather error:", error)
            errorMessage = "Failed to fetch weather data."
        }

        isLoading = false
    }

    // MARK: - Private Methods

    private func updateWeatherData(_ forecast: Weather) {
        guard let firstItem = forecast.list.first else { return }
        
        currentTemperature = firstItem.main.temp
        weatherCondition = firstItem.weather.first?.main ?? "N/A"
        highTemp = Int(firstItem.main.temp)
        lowTemp = Int(firstItem.main.temp_min)
        windSpeed = Int(firstItem.wind.speed)
        humidity = firstItem.main.humidity
    }

    private func updateForecast(_ forecastResponse: ForecastResponse) {
        let calendar = Calendar.current

        // Group by day
        let groupedByDay = Dictionary(grouping: forecastResponse.list) { item in
            calendar.startOfDay(for: Date(timeIntervalSince1970: item.dt))
        }

        // Map each day to ForecastDay (for your cards)
        let dailyForecasts: [ForecastDay] = groupedByDay.compactMap { (date, items) in
            // Pick the forecast closest to noon
            guard let noon = items.min(by: { abs(Calendar.current.component(.hour, from: Date(timeIntervalSince1970: $0.dt)) - 12) <
                                            abs(Calendar.current.component(.hour, from: Date(timeIntervalSince1970: $1.dt)) - 12) }) else { return nil }

            let dayDate = Date(timeIntervalSince1970: noon.dt)
            let dayName = dayDate.formatted(.dateTime.weekday(.abbreviated)).uppercased()

            return ForecastDay(
                dayName: dayName,
                temperature: Int(noon.main.temp),
                iconName: mapIcon(noon.weather.first?.main ?? "Clear")
            )
        }

        // Sort by date and pick 5 days
        forecast = dailyForecasts.sorted { $0.dayName < $1.dayName }.prefix(5).map { $0 }
    }

    private func mapIcon(_ condition: String) -> String {
        switch condition {
        case "Clear": return "sun.max.fill"
        case "Clouds": return "cloud.fill"
        case "Rain": return "cloud.rain.fill"
        case "Thunderstorm": return "cloud.bolt.rain.fill"
        default: return "cloud.sun.fill"
        }
    }
}
