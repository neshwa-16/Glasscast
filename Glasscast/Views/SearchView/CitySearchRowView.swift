//
//  CitySearchRowView.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct CitySearchRowView<TrailingContent: View>: View {
    let city: CitySearchResult
    @ViewBuilder let trailingContent: () -> TrailingContent
    
    var body: some View {
        HStack(spacing: 16) {
            // Location Icon
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor.tertiarySystemGroupedBackground))
                    .frame(width: 56, height: 56)
                
                Image(systemName: "mappin.and.ellipse")
                    .font(.title2)
                    .foregroundStyle(.primary)
            }
            
            // City Info
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Text(city.name)
                        .font(.body)
                        .fontWeight(.medium)
                    
                    if city.isVerified {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.caption)
                            .foregroundStyle(.blue)
                    }
                }
                
                Text(city.region)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            // Trailing Action
            trailingContent()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .contentShape(Rectangle())
    }
}