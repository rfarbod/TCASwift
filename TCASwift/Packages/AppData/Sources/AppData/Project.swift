//
//  File.swift
//  
//
//  Created by Farbod Rahiminik on 7/18/24.
//

import Foundation

public struct Project: Codable {
    public let id: String
    public let name: String
    public let client: Client

    public init(id: String, name: String, client: Client) {
        self.id = id
        self.name = name
        self.client = client
    }
}

public struct Client: Codable {
    public let id: String
    public let links: Links

    public init(id: String, links: Links) {
        self.id = id
        self.links = links
    }
}
