//
//  SearchResultsSection.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

@MainActor
struct SearchResultsSection: View {
    @ObservedObject var viewModel: CitySearchViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("SEARCH RESULTS")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
                .padding(.horizontal, 16)
                .padding(.bottom, 12)
            
            VStack(spacing: 0) {
                if viewModel.isSearching {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 32)
                } else if viewModel.searchResults.isEmpty {
                    Text("No cities found")
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 32)
                } else {
                    ForEach(viewModel.searchResults) { city in
                        CitySearchRowView(
                            city: city,
                            trailingContent: {
                                Button(action: {
                                    Task {
                                        await viewModel.addCity(city)
                                    }
                                }) {
                                    Image(systemName: city.isFavorite ? "heart.fill" : "heart")
                                        .foregroundStyle(city.isFavorite ? .red : .gray)
                                        .animation(.easeInOut, value: city.isFavorite)
                                }
                            }
                        )
                        
                        if city.id != viewModel.searchResults.last?.id {
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
