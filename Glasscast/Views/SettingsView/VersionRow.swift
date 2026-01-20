//
//  VersionRow.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct VersionRow: View {
    var body: some View {
        HStack(spacing: 16) {
            // Icon
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 56, height: 56)
                
                Image(systemName: "info.circle")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            
            // Label
            Text("Version")
                .font(.body)
            
            Spacer()
            
            // Version Number
            Text("2.4.0 (102)")
                .font(.body)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}