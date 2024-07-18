//
//  Links.swift
//
//
//  Created by Farbod Rahiminik on 7/18/24.
//

import Foundation

public struct Links: Codable {
    public let heroImage: String
    public let thumbImage: String

    public init(heroImage: String, thumbImage: String) {
        self.heroImage = heroImage
        self.thumbImage = thumbImage
    }

    enum CodingKeys: String, CodingKey {
        case heroImage = "hero_image"
        case thumbImage = "thumb_image"
    }
}
