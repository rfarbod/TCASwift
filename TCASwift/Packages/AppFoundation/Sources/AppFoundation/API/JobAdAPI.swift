//
//  JobAdAPI.swift
//
//
//  Created by Farbod Rahiminik on 7/19/24.
//

import AppData
import Foundation

protocol JobAdAPIProtocol {
    static func fetchJobAds(date: String) async throws -> JobResponse
}

final class JobAdAPI: JobAdAPIProtocol {
    private static let networkManager: NetworkManagerProtocol = NetworkManager.shared
    private static let jsonDecoder: JSONDecoder = JSONDecoder()

    static func fetchJobAds(date: String) async throws -> JobResponse {
        let (data, _) = try await networkManager.request(api: JobRequest.fetchAds(date: date), retryCount: 5)

        return try jsonDecoder.decode(JobResponse.self, from: data)
    }
}
