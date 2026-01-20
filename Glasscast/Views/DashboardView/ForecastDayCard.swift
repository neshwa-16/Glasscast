//
//  ForecastDayCard.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct ForecastDayCard: View {
    let day: ForecastDay
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            Text(day.dayName)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(isSelected ? .white : .primary)
            
            Image(systemName: day.iconName)
                .font(.title)
                .foregroundStyle(isSelected ? .white : .primary)
                .symbolRenderingMode(.multicolor)
            
            Text("\(day.temperature)°")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(isSelected ? .white : .primary)
        }
        .frame(width: 100)
        .padding(.vertical, 24)
        .background(isSelected ? .blue : .white.opacity(0.5))
        .cornerRadius(25)
        .shadow(color: isSelected ? .blue.opacity(0.3) : .clear, radius: 10, y: 5)
    }
}

#Preview {
    HStack {
        ForecastDayCard(
            day: ForecastDay(dayName: "MON", temperature: 22, iconName: "sun.max.fill"),
            isSelected: true
        )
        ForecastDayCard(
            day: ForecastDay(dayName: "TUE", temperature: 24, iconName: "cloud.sun.fill"),
            isSelected: false
        )
    }
    .padding()
}
