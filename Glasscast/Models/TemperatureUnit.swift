//
//  TemperatureUnit.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import Foundation

enum TemperatureUnit: String, Codable, CaseIterable {
    case celsius = "C"
    case fahrenheit = "F"
    
    var symbol: String {
        "°\(rawValue)"
    }
    
    func convert(_ celsius: Double) -> Double {
        switch self {
        case .celsius:
            return celsius
        case .fahrenheit:
            return (celsius * 9/5) + 32
        }
    }
}