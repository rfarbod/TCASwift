//
//  File.swift
//  
//
//  Created by Farbod Rahiminik on 7/19/24.
//

import Foundation

enum JobRequest {
    case fetchAds(date: String)
}

extension JobRequest: RequestProtocol {
    var path: String {
        switch self {
        case .fetchAds(_):
            return "shifts"
        }
    }

    var parameters: RequestParameters? {
        switch self {
        case let .fetchAds(date):
            return ["filter[date]" : date]
        }
    }
}
