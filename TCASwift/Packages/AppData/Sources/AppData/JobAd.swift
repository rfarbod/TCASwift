//
//  File.swift
//  AppData
//
//  Created by Farbod Rahiminik on 7/16/24.
//

import Foundation

public struct JobAd: Codable {
    public let id: String
    public let stauts: String
    public let startsAt: Date
    public let endsAt: Date
    public let duration: Int
    public let tempersNeeded: Int
    public let enableAUtoAcceptRecentFreelancers: Bool
    public let cancellationPolicy: Int
    public let archivedAt: Date?
    public let createdAt: Date
    public let earningsPerHour: Currency

    public init(
        id: String,
        stauts: String,
        startsAt: Date,
        endsAt: Date,
        duration: Int,
        tempersNeeded: Int,
        enableAUtoAcceptRecentFreelancers: Bool,
        cancellationPolicy: Int,
        archivedAt: Date?,
        createdAt: Date,
        earningsPerHour: Currency
    ) {
        self.id = id
        self.stauts = stauts
        self.startsAt = startsAt
        self.endsAt = endsAt
        self.duration = duration
        self.tempersNeeded = tempersNeeded
        self.enableAUtoAcceptRecentFreelancers = enableAUtoAcceptRecentFreelancers
        self.cancellationPolicy = cancellationPolicy
        self.archivedAt = archivedAt
        self.createdAt = createdAt
        self.earningsPerHour = earningsPerHour
    }
}
