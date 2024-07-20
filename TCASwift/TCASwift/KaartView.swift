//
//  KaartView.swift
//  TCASwift
//
//  Created by Farbod Rahiminik on 7/20/24.
//

import AppFoundation
import SwiftUI
import MapKit

struct KaartView: View {
    @State var region = MKCoordinateRegion(
            center: .init(latitude: 51.334_900,longitude: 37.009_020),
            span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )

    private var locationManager: CLLocationManager = .init()

    var body: some View {
        Map(
          coordinateRegion: $region,
          showsUserLocation: true,
          userTrackingMode: .constant(.follow)
        )
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
        }
        .padding(.vertical, 20)
    }
}
