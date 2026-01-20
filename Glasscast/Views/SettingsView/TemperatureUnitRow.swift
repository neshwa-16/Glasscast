//
//  TemperatureUnitRow.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct TemperatureUnitRow: View {
    @Binding var selectedUnit: TemperatureUnit
    
    var body: some View {
        HStack(spacing: 16) {
            // Icon
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue.opacity(0.1))
                    .frame(width: 56, height: 56)
                
                Image(systemName: "thermometer.medium")
                    .font(.title2)
                    .foregroundStyle(.blue)
            }
            
            // Label
            Text("Temperature Unit")
                .font(.body)
            
            Spacer()
            
            // Segmented Control
            Picker("Temperature Unit", selection: $selectedUnit) {
                Text("°C").tag(TemperatureUnit.celsius)
                Text("°F").tag(TemperatureUnit.fahrenheit)
            }
            .pickerStyle(.segmented)
            .frame(width: 120)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}