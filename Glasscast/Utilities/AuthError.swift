//
//  AuthError.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//
import Foundation

enum AuthError: LocalizedError {
    case invalidEmail
    case weakPassword
    case unauthorized
    
    var errorDescription: String? {
        switch self {
        case .invalidEmail:
            return "Please enter a valid email address"
        case .weakPassword:
            return "Password must be at least 6 characters"
        case .unauthorized:
            return "Invalid email or password"
        }
    }
}
