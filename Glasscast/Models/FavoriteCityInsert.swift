//
//  FavoriteCityInsert.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//

import Foundation

struct FavoriteCityInsert: Encodable {
    let user_id: UUID
    let city_name: String
    let lat: Double
    let lon: Double
    let created_at : Date
}
