//
//  WeatherDetailsSection.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct WeatherDetailsSection: View {
    @ObservedObject var viewModel: DashboardViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            WeatherDetailCard(
                icon: "wind",
                value: "\(viewModel.windSpeed)km/h",
                tint: .blue
            )
            
            WeatherDetailCard(
                icon: "drop.fill",
                value: "\(viewModel.humidity)%",
                tint: .blue
            )
            
            WeatherDetailCard(
                icon: "umbrella.fill",
                value: "\(viewModel.precipitation)%",
                tint: .blue
            )
        }
    }
}