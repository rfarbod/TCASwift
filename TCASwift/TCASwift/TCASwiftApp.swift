//
//  TCASwiftApp.swift
//  TCASwift
//
//  Created by Farbod Rahiminik on 7/15/24.
//

import AppFoundation
import ComposableArchitecture
import SwiftUI

@main
struct TCASwiftApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(initialState: JobReducer.State()) {
                    JobReducer()
                }
            )
        }
    }
}
