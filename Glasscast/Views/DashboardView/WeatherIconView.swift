//
//  WeatherIconView.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct WeatherIconView: View {
    var body: some View {
        ZStack {
            // Sun rays
            ForEach(0..<8) { index in
                RoundedRectangle(cornerRadius: 4)
                    .fill(.yellow)
                    .frame(width: 8, height: 24)
                    .offset(y: -60)
                    .rotationEffect(.degrees(Double(index) * 45))
            }
            
            // Sun circle
            Circle()
                .fill(.yellow)
                .frame(width: 80, height: 80)
        }
        .frame(width: 140, height: 140)
    }
}

#Preview {
    WeatherIconView()
}