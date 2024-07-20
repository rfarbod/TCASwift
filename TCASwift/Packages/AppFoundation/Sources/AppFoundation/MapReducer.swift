//
//  File.swift
//
//
//  Created by Farbod Rahiminik on 7/20/24.
//

import ComposableArchitecture
import CoreLocation
import Foundation

@Reducer
public struct MapReducer {
    @ObservableState
    public struct State {
        public var userLocation: CLLocationCoordinate2D = .init(latitude: 0, longitude: 0)
        public var hasAccessToLocation: Bool = false

        public init(userLocation: CLLocationCoordinate2D, hasAccessToLocation: Bool) {
            self.userLocation = userLocation
            self.hasAccessToLocation = hasAccessToLocation
        }
    }

    public enum Action {
        case onAppear
        case askForPermission
        case didGetAccessToUserLocation(location: CLLocationCoordinate2D)
    }

    private var locationManager: LocationManager = .init()

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                if checkIfLocationIsEnabled() {
                    return .run { send in
                        send(.askForPermission)
                    }
                }

            case .askForPermission:

            }
        }
    }
}

extension MapReducer: CLLocationManagerDelegate {
    
}
