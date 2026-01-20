//
//  Location.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import Foundation
import CoreLocation

struct Location: Codable, Identifiable {
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}