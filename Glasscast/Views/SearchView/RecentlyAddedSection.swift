//
//  RecentlyAddedSection.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct RecentlyAddedSection: View {
    @ObservedObject var viewModel: CitySearchViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("FAVORITE CITIES")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
                .padding(.horizontal, 16)
                .padding(.bottom, 12)
            
            VStack(spacing: 0) {
                if viewModel.recentCities.isEmpty {
                    Text("No recent cities")
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 32)
                } else {
                    ForEach(viewModel.recentCities) { city in
                        CitySearchRowView(
                            city: city,
                            trailingContent: {
                                Button(action: {
                                    Task {
                                        await viewModel.toggleFavorite(city)
                                    }
                                }) {
                                    Image(systemName: city.isFavorite ? "heart.fill" : "heart")
                                        .font(.title3)
                                        .foregroundStyle(city.isFavorite ? .red : .gray)
                                }
                            }
                        )
                        
                        if city.id != viewModel.recentCities.last?.id {
                            Divider()
                                .padding(.leading, 72)
                        }
                    }
                }
            }
            .background(Color(UIColor.secondarySystemGroupedBackground))
            .cornerRadius(12)
            .padding(.horizontal, 16)
        }
    }
}
