//
//  CitySyncingRow.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct CitySyncingRow: View {
    let lastSyncTime: String
    
    var body: some View {
        HStack(spacing: 16) {
            // Icon
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue.opacity(0.1))
                    .frame(width: 56, height: 56)
                
                Image(systemName: "arrow.triangle.2.circlepath")
                    .font(.title2)
                    .foregroundStyle(.blue)
            }
            
            // Label
            Text("City Syncing")
                .font(.body)
            
            Spacer()
            
            // Sync Status
            HStack(spacing: 8) {
                Text(lastSyncTime)
                    .font(.subheadline)
                    .foregroundStyle(.green)
                
                Image(systemName: "info.circle")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}