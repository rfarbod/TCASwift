//
//  APIError.swift
//
//
//  Created by Farbod Rahiminik on 7/19/24.
//

import Foundation

public enum APIError: Error, CustomStringConvertible, Equatable {
    case badRequest
    case authorizationError
    case serverError
    case unknown

    public var description: String {
        switch self {
        case .badRequest:
            return "bad request"
        case .authorizationError:
            return "authorization error"
        case .serverError:
            return "server error"
        case .unknown:
            return "unknown error"
        }
    }
}
