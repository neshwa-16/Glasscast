//
//  ForecastSection.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct ForecastSection: View {
    @ObservedObject var viewModel: DashboardViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("5-Day Forecast")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button("View All") {
                    viewModel.showFullForecast.toggle()
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.blue)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(Array(viewModel.forecast.enumerated()), id: \.offset) { index, day in
                        ForecastDayCard(
                            day: day,
                            isSelected: index == 0
                        )
                    }
                }
            }
        }
    }
}