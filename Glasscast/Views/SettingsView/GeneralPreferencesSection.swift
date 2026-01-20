//
//  GeneralPreferencesSection.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct GeneralPreferencesSection: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("General Preferences")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.horizontal, 16)
            
            VStack(spacing: 0) {
                // Temperature Unit
                TemperatureUnitRow(
                    selectedUnit: $viewModel.temperatureUnit
                )
                
                Divider()
                    .padding(.leading, 72)
                
                // Weather Alerts
                WeatherAlertsRow(
                    isEnabled: $viewModel.weatherAlertsEnabled
                )
            }
            .background(Color(UIColor.secondarySystemGroupedBackground))
            .cornerRadius(12)
            .padding(.horizontal, 16)
        }
    }
}