//
//  File.swift
//  AppData
//
//  Created by Farbod Rahiminik on 7/16/24.
//

import Foundation

public struct JobAd: Codable, Identifiable {
    public let id: String
    public let startAt: Date
    public let endsAt: Date
    public let earningsPerHour: Earning
    public let job: Job

    private var isOpen: Bool {
        return endsAt > .now
    }

    public var statusText: String {
        return isOpen ? "SERVING" : "CLOSED"
    }

    enum CodingKeys: String, CodingKey {
        case id
        case startAt = "start_at"
        case endsAt = "ends_at"
        case earningsPerHour = "earnings_per_hour"
        case job
    }

    public init(
        id: String,
        startAt: Date,
        endsAt: Date,
        earningsPerHour: Earning,
        job: Job
    ) {
        self.id = id
        self.startAt = startAt
        self.endsAt = endsAt
        self.earningsPerHour = earningsPerHour
        self.job = job
    }
}
