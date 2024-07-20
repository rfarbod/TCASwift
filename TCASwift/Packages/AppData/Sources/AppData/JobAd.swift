//
//  JobAd.swift
//  AppData
//
//  Created by Farbod Rahiminik on 7/16/24.
//

import Foundation

public struct JobAd: Identifiable, Equatable {
    public let id: String
    public let earningsPerHour: Earning
    public let job: Job
    public let isOpen: Bool
    public let startHour: String
    public let endHour: String
    public let statusText: String

    public init(
        id: String,
        earningsPerHour: Earning,
        job: Job,
        isOpen: Bool,
        startHour: String,
        endHour: String,
        statusText: String
    ) {
        self.id = id
        self.earningsPerHour = earningsPerHour
        self.job = job
        self.isOpen = isOpen
        self.startHour = startHour
        self.endHour = endHour
        self.statusText = statusText
    }


    public static func == (lhs: JobAd rhs: JobAd) -> Bool {
        lhs.id == rhs.id
    }
}
