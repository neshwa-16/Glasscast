//
//  DashboardView.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                LinearGradient(
                    colors: [
                        Color(red: 0.85, green: 0.9, blue: 0.95),
                        Color(red: 0.9, green: 0.92, blue: 0.96)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                if viewModel.isLoading {
                    LoadingView()
                } else if let error = viewModel.errorMessage {
                    ErrorView(message: error) {
                        Task { await viewModel.fetchWeather() }
                    }
                } else {
                    ScrollView {
                        VStack(spacing: 24) {
                            // Current Weather Section
                            CurrentWeatherSection(viewModel: viewModel)
                            
                            // Weather Details (Wind, Humidity, Precipitation)
                            WeatherDetailsSection(viewModel: viewModel)
                            
                            // 5-Day Forecast
                            ForecastSection(viewModel: viewModel)
                            
                            // Regional Map
                            RegionalMapSection()
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .padding(.bottom, 100)
                    }
                }
            }
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button(action: { viewModel.showProfile.toggle() }) {
//                        Image(systemName: "person.circle.fill")
//                            .font(.title2)
//                            .foregroundStyle(.primary)
//                    }
//                }
//                
//                ToolbarItem(placement: .topBarTrailing) {
//                    Button(action: { viewModel.showSettings.toggle() }) {
//                        Image(systemName: "gearshape.fill")
//                            .font(.title2)
//                            .foregroundStyle(.primary)
//                    }
//                }
//            }
            .task {
                await viewModel.fetchWeather()
            }
            .refreshable {
                await viewModel.fetchWeather()
            }
        }
    }
}

#Preview {
    DashboardView()
}
