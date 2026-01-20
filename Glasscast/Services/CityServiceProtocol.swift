//
//  CityServiceProtocol.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import Foundation

protocol CityServiceProtocol {
    func searchCities(query: String) async throws -> [CitySearchResult]
}

final class CityService: CityServiceProtocol {
    static let shared = CityService()
    private let apiClient: APIClient
    
    init(apiClient: APIClient = .shared) {
        self.apiClient = apiClient
    }
    
    func searchCities(query: String) async throws -> [CitySearchResult] {
        guard !query.isEmpty else { return [] }
        
        let endpoint = GeocodingEndpoint.search(query: query)
        
        // APIClient should return raw Data
        let data = try await apiClient.requestData(from: endpoint)
        
        // Decode directly into array
        return try JSONDecoder().decode([CitySearchResult].self, from: data)
    }
}

