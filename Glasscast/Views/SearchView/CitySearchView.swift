//
//  CitySearchView.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct CitySearchView: View {
    @StateObject private var viewModel = CitySearchViewModel()
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isSearchFocused: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Color(UIColor.systemGroupedBackground)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Search Bar
                    SearchBarView(
                        searchText: $viewModel.searchQuery,
                        isSearchFocused: $isSearchFocused,
                        onCancel: {
                            viewModel.searchQuery = ""
                        }
                    )
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    
                    ScrollView {
                        VStack(spacing: 24) {
                            // Search Results
                            if !viewModel.searchQuery.isEmpty {
                                SearchResultsSection(viewModel: viewModel)
                            }
                            
                            // Recently Added Cities
                            RecentlyAddedSection(viewModel: viewModel)
                            
                            // Syncing Status
                            if viewModel.isSyncing {
                                SyncingStatusView()
                            }
                        }
                        .padding(.top, 8)
                    }
                }
            }
            .navigationTitle("Add City")
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button(action: { dismiss() }) {
//                        Image(systemName: "chevron.left")
//                            .font(.body.weight(.semibold))
//                            .foregroundStyle(.primary)
//                    }
//                }
//            }
            .task {
                await viewModel.loadRecentCities()
            }
            .onAppear {
                isSearchFocused = true
            }
        }
    }
}

#Preview {
    CitySearchView()
}
