//
//  File.swift
//
//
//  Created by Farbod Rahiminik on 7/19/24.
//

import Foundation

public protocol DateFormat {
    func string(from date: Date) -> String
}

extension ISO8601DateFormatter: DateFormat {}

public extension DateFormatter {
    static var iso8601DateFormatter: DateFormat = {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withDashSeparatorInDate,
            .withYear,
            .withMonth,
            .withDay
        ]
        return isoDateFormatter
    }()
}
