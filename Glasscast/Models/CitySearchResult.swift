//
//  CitySearchResult.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import Foundation

struct CitySearchResult: Identifiable, Codable {
    let id: String
    let name: String
    let region: String
    let country: String
    let latitude: Double
    let longitude: Double
    let isVerified: Bool
    var isFavorite: Bool
    let addedAt: Date?

    // MARK: - API decoding keys
    enum CodingKeys: String, CodingKey {
        case name
        case region = "state"
        case country
        case latitude = "lat"
        case longitude = "lon"
    }

    // MARK: - API initializer
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = UUID().uuidString
        self.name = try container.decode(String.self, forKey: .name)
        self.region = try container.decodeIfPresent(String.self, forKey: .region) ?? ""
        self.country = try container.decode(String.self, forKey: .country)
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)

        self.isVerified = true
        self.isFavorite = false
        self.addedAt = nil
    }

    // MARK: - App / DB initializer ✅
    init(
        id: String = UUID().uuidString,
        name: String,
        region: String,
        country: String,
        latitude: Double,
        longitude: Double,
        isVerified: Bool = true,
        isFavorite: Bool = false,
        addedAt: Date? = nil
    ) {
        self.id = id
        self.name = name
        self.region = region
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        self.isVerified = isVerified
        self.isFavorite = isFavorite
        self.addedAt = addedAt
    }
}

struct FavoriteCityRow: Decodable {
    let id: UUID
    let city_name: String
    let region: String?
    let country: String?
    let lat: Double
    let lon: Double
    let created_at: Date
}

extension FavoriteCityRow {
    func toCitySearchResult() -> CitySearchResult {
        CitySearchResult(
            id: id.uuidString,
            name: city_name,
            region: "",
            country: "",
            latitude: lat,
            longitude: lon,
            isVerified: true,
            isFavorite: true,
            addedAt: created_at
        )
    }
}
