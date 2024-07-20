//
//  File.swift
//  
//
//  Created by Farbod Rahiminik on 7/20/24.
//

import Foundation

final class JobAdMapper {
    public static func mapDTO(_ dto: JobAdDTO) -> JobAd {
        return JobAd(
            id: dto.id,
            earningsPerHour: dto.earningsPerHour,
            job: dto.job,
            isOpen: isOpen(dto.endsAt),
            startHour: getHourStringFromDate(dto.startAt),
            endHour: getHourStringFromDate(dto.endsAt),
            statusText: getStatusText(isOpen: isOpen(dto.endsAt))
        )
    }

    private static func isOpen(_ endsAt: String) -> Bool {
        let endDate: Date = ISO8601DateFormatter().date(from: dto.endsAt) ?? .now
        return endDate > .now
    }

    private static func getHourStringFromDate(_ dateString: String) -> String {
        let date: Date = ISO8601DateFormatter().date(from: dateString) ?? .now
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: date)
        let hour = calendar.date(from: components)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:MM"
        return dateFormatter.string(from: hour ?? .now)
    }
    
    public func getStatusText(isOpen: Bool) -> String {
        return isOpen ? "SERVING" : "CLOSED"
    }
}
