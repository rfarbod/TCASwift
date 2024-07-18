//
//  File.swift
//  
//
//  Created by Farbod Rahiminik on 7/18/24.
//

import Foundation

public struct ReportAtAddress: Codable {
    public let geo: Geo

    public init(geo: Geo) {
        self.geo = geo
    }
}

public struct Geo: Codable {
    public let lat: Double
    public let lon: Double

    public init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
}
