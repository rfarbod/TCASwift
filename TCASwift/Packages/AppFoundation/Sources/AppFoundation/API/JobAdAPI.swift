//
//  JobAdAPI.swift
//
//
//  Created by Farbod Rahiminik on 7/19/24.
//

import AppData
import Foundation

protocol JobAdAPIProtocol {
    func fetchJobAds(date: String) async throws -> JobResponse
}

final class JobAdAPI: JobAdAPIProtocol {
    private let networkManager: NetworkManagerProtocol
    private let jsonDecoder: JSONDecoder

    init(
        networkManager: NetworkManagerProtocol = NetworkManager.shared,
        jsonDecoder: JSONDecoder = JSONDecoder()
    ) {
        self.networkManager = networkManager
        self.jsonDecoder = jsonDecoder
    }

    func fetchJobAds(date: String) async throws -> JobResponse {
        let (data, _) = try await networkManager.request(api: JobRequest.fetchAds(date: date), retryCount: 5)

        return try jsonDecoder.decode(JobResponse.self, from: data)
    }
}
