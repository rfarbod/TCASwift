//
//  File.swift
//  AppData
//
//  Created by Farbod Rahiminik on 7/16/24.
//

import Foundation

public struct Job: Codable {
    let id: String
    let stauts: String
    let startsAt: Date
    let endsAt: Date
    let duration: Int
    let tempersNeeded: Int
    let enableAUtoAcceptRecentFreelancers: Bool
    let cancellationPolicy: Int
    let archivedAt: Date?
    let createdAt: Date
    let earningsPerHour: Currency
}
