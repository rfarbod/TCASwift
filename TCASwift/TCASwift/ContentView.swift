//
//  ContentView.swift
//  TCASwift
//
//  Created by Farbod Rahiminik on 7/15/24.
//

import AppFoundation
import AppUI
import ComposableArchitecture
import SwiftUI

struct ContentView: View {
    let store: StoreOf<JobReducer>

    var body: some View {
        WithPerceptionTracking {
            VStack {
                JobAdsView(store: store)
            }
            .onAppear {
                store.send(.getJobs)
            }
        }
    }
}
