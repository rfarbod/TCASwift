//
//  File.swift
//  AppData
//
//  Created by Farbod Rahiminik on 7/16/24.
//

import Foundation

public struct JobAd: Codable, Identifiable, Equatable {
    public let id: String
    public let startAt: String
    public let endsAt: String
    public let earningsPerHour: Earning
    public let job: Job

    private var isOpen: Bool {
        return false
    }

    public var statusText: String {
        return isOpen ? "SERVING" : "CLOSED"
    }

    enum CodingKeys: String, CodingKey {
        case id
        case startAt = "starts_at"
        case endsAt = "ends_at"
        case earningsPerHour = "earnings_per_hour"
        case job
    }

    public init(
        id: String,
        startAt: String,
        endsAt: String,
        earningsPerHour: Earning,
        job: Job
    ) {
        self.id = id
        self.startAt = startAt
        self.endsAt = endsAt
        self.earningsPerHour = earningsPerHour
        self.job = job
    }

    public static func == (lhs: JobAd, rhs: JobAd) -> Bool {
        lhs.id == rhs.id
    }
}
