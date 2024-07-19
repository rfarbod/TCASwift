//
//  File.swift
//  
//
//  Created by Farbod Rahiminik on 7/19/24.
//

import Foundation

enum JobRequest {
    case fetchAds(date: Date)
}

extension JobRequest: RequestProtocol {
    var path: String {
        switch self {
        case .fetchAds(let date):
            return "shifts"
        }
    }

    var parameters: RequestParameters? {
        switch self {
        case let .fetchAds(date):
            return ["date" : date]
        }
    }
}
