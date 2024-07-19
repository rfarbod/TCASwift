//
//  NetworkManager.swift
//
//
//  Created by Farbod Rahiminik on 7/19/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func request(api: RequestProtocol, retryCount: Int) async throws -> (Data, URLResponse)
}

public class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    let urlSession: URLSession

    private init(config: URLSessionConfiguration = .default) {
        self.urlSession = URLSession(configuration: config)
    }

    func request(api: RequestProtocol, retryCount: Int = 5) async throws -> (Data, URLResponse) {
        guard let apiRequest = api.urlRequest() else {
            throw APIError.badRequest
        }

        for retryIndex in 0 ..< retryCount {
            try Task.checkCancellation()
            do {
                let (data, response) = try await urlSession.data(for: apiRequest)
                return try api.verifyResponse(data: data, response: response)
            } catch where retryIndex < retryCount - 1 {
                try await Task.sleep(nanoseconds: api.retryDelay)
                continue
            } catch {
                throw error
            }
        }
        throw APIError.unknown
    }
}
