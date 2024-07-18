//
//  File.swift
//  
//
//  Created by Farbod Rahiminik on 7/18/24.
//

import Foundation

public struct Job: Codable {
    public let id: String
    public let reportAtAddress: ReportAtAddress
    public let project: Project

    enum CodingKeys: String, CodingKey {
        case id
        case reportAtAddress = "report_at_address"
        case project
    }

    public init(id: String, reportAtAddress: ReportAtAddress, project: Project) {
        self.id = id
        self.reportAtAddress = reportAtAddress
        self.project = project
    }
}
