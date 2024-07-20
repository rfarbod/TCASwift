//
//  JobAdDTO.swift
//  AppData
//
//  Created by Farbod Rahiminik on 7/16/24.
//

import Foundation

public struct JobAdDTO: Codable {
    public let id: String
    public let startAt: String
    public let endsAt: String
    public let earningsPerHour: Earning
    public let job: Job

    public var isOpen: Bool {
        let endDate: Date = ISO8601DateFormatter().date(from: endsAt) ?? .now
        return endDate > .now
    }

    public var statusText: String {
        return isOpen ? "SERVING" : "CLOSED"
    }

    public var startHour: String {
        let startDate: Date = ISO8601DateFormatter().date(from: startAt) ?? .now
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: startDate)
        let hour = calendar.date(from: components)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:MM"
        return dateFormatter.string(from: hour ?? .now)
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

    public static func == (lhs: JobAdDTO, rhs: JobAdDTO) -> Bool {
        lhs.id == rhs.id
    }
}
