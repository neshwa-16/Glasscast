//
//  CitySearchViewModel.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import Foundation

@MainActor
final class CitySearchViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var searchQuery = "" {
        didSet {
            Task {
                await performSearch()
            }
        }
    }
    @Published var searchResults: [CitySearchResult] = []
    @Published var recentCities: [CitySearchResult] = []
    @Published var isSearching = false
    @Published var isSyncing = false
    
    // MARK: - Dependencies
    private let cityService: CityServiceProtocol
    private let databaseService: DatabaseServiceProtocol
    
    private var searchTask: Task<Void, Never>?
    
    // MARK: - Initialization
    init(
        cityService: CityServiceProtocol = CityService.shared,
        databaseService: DatabaseServiceProtocol = DatabaseService.shared
    ) {
        self.cityService = cityService
        self.databaseService = databaseService
    }
    
    // MARK: - Public Methods
    func loadRecentCities() async {
        do {
            recentCities = try await databaseService.fetchRecentCities()
        } catch {
            print("Failed to load recent cities: \(error)")
        }
    }
   
    func addCity(_ city: CitySearchResult) async {
        isSyncing = true
        defer { isSyncing = false }

        do {
            try await databaseService.saveCity(city)

            if let index = searchResults.firstIndex(where: { $0.id == city.id }) {
                searchResults[index].isFavorite = true
            }

            if let index = recentCities.firstIndex(where: { $0.id == city.id }) {
                recentCities[index].isFavorite = true
            }

        } catch {
            print("Failed to add city:", error)
        }
    }

    func toggleFavorite(_ city: CitySearchResult) async {
        do {
            try await databaseService.toggleCityFavorite(city.id)
            await loadRecentCities()
        } catch {
            print("Failed to toggle favorite: \(error)")
        }
    }
    
    // MARK: - Private Methods
    private func performSearch() async {
        // Cancel previous search
        searchTask?.cancel()
        
        // Clear results if query is empty
        guard !searchQuery.isEmpty else {
            searchResults = []
            return
        }
        
        // Debounce search
        searchTask = Task {
            try? await Task.sleep(nanoseconds: 300_000_000) // 300ms debounce
            
            guard !Task.isCancelled else { return }
            
            await executeSearch()
        }
    }
    
    private func executeSearch() async {
        isSearching = true
        
        do {
            searchResults = try await cityService.searchCities(query: searchQuery)
        } catch {
            print("Search failed: \(error)")
            searchResults = []
        }
        
        isSearching = false
    }
}
