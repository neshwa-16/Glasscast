//
//  WeatherAlertsRow.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct WeatherAlertsRow: View {
    @Binding var isEnabled: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            // Icon
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue.opacity(0.1))
                    .frame(width: 56, height: 56)
                
                Image(systemName: "bell.fill")
                    .font(.title2)
                    .foregroundStyle(.blue)
            }
            
            // Label
            Text("Weather Alerts")
                .font(.body)
            
            Spacer()
            
            // Toggle
            Toggle("", isOn: $isEnabled)
                .labelsHidden()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}