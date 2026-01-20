//
//  WeatherDetailCard.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct WeatherDetailCard: View {
    let icon: String
    let value: String
    let tint: Color
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(tint)
            
            Text(value)
                .font(.title3)
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        //.background(.ultraThinMaterial)
        .background(.white.opacity(0.5))
        .cornerRadius(20)
    }
}

#Preview {
    WeatherDetailCard(icon: "wind", value: "12km/h", tint: .blue)
}
