//
//  DatabaseServiceProtocol.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//

import Supabase
import Foundation

protocol DatabaseServiceProtocol {
    func fetchRecentCities() async throws -> [CitySearchResult]
    func saveCity(_ city: CitySearchResult) async throws
    func toggleCityFavorite(_ cityId: String) async throws
}

final class DatabaseService: DatabaseServiceProtocol {
    static let shared = DatabaseService()
    
    let supabase = SupabaseClient(
        supabaseURL: URL(string: ConfigurationManager.shared.supabaseURL)!,
        supabaseKey: ConfigurationManager.shared.supabaseAnonKey
    )
    
    private init() {}
    
    func fetchRecentCities() async throws -> [CitySearchResult] {
        let response = try await supabase
            .from("favorite_cities")
            .select("""
                id,
                city_name,
                lat,
                lon,
                created_at
            """)
            .order("created_at", ascending: false)
            .execute()

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)

            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXXXX"

            guard let date = formatter.date(from: dateString) else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid date: \(dateString)"
                )
            }

            return date
        }

        let rows = try decoder.decode([FavoriteCityRow].self, from: response.data)
        return rows.map { $0.toCitySearchResult() }
    }

    func saveCity(_ city: CitySearchResult) async throws {
        let session = try await supabase.auth.session

            let payload = FavoriteCityInsert(
                user_id: session.user.id,
                city_name: city.name,
                lat: city.latitude,
                lon: city.longitude,
                created_at: city.addedAt ?? Date()
            )

            try await supabase
                .from("favorite_cities")
                .insert(payload)
                .execute()
    }
    
    func toggleCityFavorite(_ cityId: String) async throws {
        try await supabase
                .from("favorite_cities")
                .delete()
                .eq("id", value: cityId)
                .execute()
    }
}
