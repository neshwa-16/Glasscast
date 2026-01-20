//
//  CurrentWeatherSection.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct CurrentWeatherSection: View {
    @ObservedObject var viewModel: DashboardViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            // Location Header
            HStack(spacing: 6) {
                Image(systemName: "mappin.and.ellipse")
                    .font(.subheadline)
                    .foregroundStyle(.blue)
                
                Text(viewModel.locationName)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            
            Text("SYNCED WITH SUPABASE")
                .font(.caption)
                .foregroundStyle(.secondary)
                .tracking(1.2)
            
            // Weather Icon
            WeatherIconView()
                .padding(.vertical, 20)
            
            // Temperature
            Text("\(viewModel.currentTemperature)°")
                .font(.system(size: 96, weight: .bold))
                .tracking(-4)
            
            // Condition
            Text(viewModel.weatherCondition)
                .font(.title2)
                .fontWeight(.medium)
            
            // High/Low
            Text("H: \(viewModel.highTemp)° L: \(viewModel.lowTemp)°")
                .font(.title3)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 32)
    }
}
