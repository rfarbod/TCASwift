//
//  Earning.swift
//  AppData
//
//  Created by Farbod Rahiminik on 7/16/24.
//

import Foundation

public struct Earning: Codable {
    public let currency: Currency
    public let amount: Double

    public init(currency: Currency, amount: Double) {
        self.currency = currency
        self.amount = amount
    }
}
