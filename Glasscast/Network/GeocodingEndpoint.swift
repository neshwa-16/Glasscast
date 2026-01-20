//
//  GeocodingEndpoint.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import Foundation

enum GeocodingEndpoint: Endpoint {
    case search(query: String)
    
    var baseURL: String {
        "https://api.openweathermap.org/geo/1.0"
    }
    
    var path: String {
        switch self {
        case .search:
            return "/direct"
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var queryItems: [URLQueryItem]? {
        let apiKey = ConfigurationManager.shared.openWeatherAPIKey
        
        switch self {
        case .search(let query):
            return [
                URLQueryItem(name: "q", value: query),
                URLQueryItem(name: "limit", value: "5"),
                URLQueryItem(name: "appid", value: apiKey)
            ]
        }
    }
    
    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }
}