//
//  ForecastDay.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import Foundation

struct ForecastDay: Identifiable {
    let id = UUID()
    let dayName: String
    let temperature: Int
    let iconName: String
}