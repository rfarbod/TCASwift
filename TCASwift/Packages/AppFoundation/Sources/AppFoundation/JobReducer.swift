//
//  JobReducer.swift
//
//
//  Created by Farbod Rahiminik on 7/18/24.
//

import AppData
import Foundation
import ComposableArchitecture

@Reducer
public struct JobReducer {
    @ObservableState
    public struct State {
        public var jobAds: [JobAd] = []

        public init() {}
    }

    public enum Action {
        case viewDidLoad
        case jobsRecieved([JobAd])
    }

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .viewDidLoad:
                return .run { send in
                    let data = try await JobAdAPI().fetchJobAds(date: DateFormatter.iso8601DateFormatter.string(from: .now))

                    await send(.jobsRecieved(data.data))
                }

            case let .jobsRecieved(jobAds):
                state.jobAds = jobAds
                return .none
            }
        }
    }

    public init() {}
}
