//
//  LocationServiceProtocol.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import Foundation
import CoreLocation

protocol LocationServiceProtocol {
    func getCurrentLocation() async throws -> Location
}

final class LocationService: NSObject, LocationServiceProtocol {
    static let shared = LocationService()
    
    private let manager = CLLocationManager()
    private var continuation: CheckedContinuation<Location, Error>?
    
    private override init() {
        super.init()
        manager.delegate = self
    }
    
    func getCurrentLocation() async throws -> Location {
        return try await withCheckedThrowingContinuation { continuation in
            self.continuation = continuation
            manager.requestWhenInUseAuthorization()
            manager.requestLocation()
        }
    }
}

extension LocationService: CLLocationManagerDelegate {
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        guard let location = locations.first else { return }

        let geocoder = CLGeocoder()

        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard let self = self else { return }

            let placemark = placemarks?.first

            let cityName =
                placemark?.locality ??
                placemark?.administrativeArea ??
                "Current Location"

            let userLocation = Location(
                id: UUID().uuidString,
                name: cityName,
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude
            )

            self.continuation?.resume(returning: userLocation)
            self.continuation = nil
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        continuation?.resume(throwing: error)
        continuation = nil
    }
}
