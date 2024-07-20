//
//  File.swift
//
//
//  Created by Farbod Rahiminik on 7/20/24.
//

import Foundation

final class Router: ObservableObject {
    public enum Destination: Codable, Hashable {
        case signIn
        case signUp
    }

    @Published var navPath = NavigationPath()

    func navigate(to destination: Destination) {
        navPath.append(destination)
    }

    func navigateBack() {
        navPath.removeLast()
    }

    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
