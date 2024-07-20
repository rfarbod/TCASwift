//
//  File.swift
//
//
//  Created by Farbod Rahiminik on 7/20/24.
//

import CoreLocation
import Foundation

final class LocationManager {
    private var locationManager: CLLocationManager?

    public init() {}

    public func checkIfLocationIsEnabled() -> Bool {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager!.delegate = self
        }

        return CLLocationManager.locationServicesEnabled()
    }

    private func checkLocationAuthorization() -> CLLocationCoordinate2D? {
        guard let location = locationManager else {
            return
        }
        switch location.authorizationStatus {
        case .notDetermined, .restricted, .denied:
            return nil

        case .authorizedAlways, .authorizedWhenInUse:
            return location.location?.coordinate

        default:
            break
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let previousAuthorizationStatus = manager.authorizationStatus
        manager.requestWhenInUseAuthorization()
        if manager.authorizationStatus != previousAuthorizationStatus {
            checkLocationAuthorization()
        }
    }
}
