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
        public var date: Date = .now

        public init() {}
    }

    public enum Action {
        case getJobs
        case goToPreviousDate
        case jobsRecieved(jobs: [JobAd])
    }

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .getJobs:
                return .run { [date = state.date, jobAds = state.jobAds] send in
                    let formattedDate = DateFormatter.iso8601DateFormatter.string(from: date)
                    let jobs = try await JobAdAPI().fetchJobAds(date: formattedDate)
                    await send(.jobsRecieved(jobs: jobs.data))
                }

            case .goToPreviousDate:
                guard let previousDate = Calendar.current.date(
                    byAdding: .day,
                    value: -1,
                    to: state.date
                ) else { return .none }

                state.date = previousDate
                return .none

            case let .jobsRecieved(jobAds):
                state.jobAds.append(contentsOf: jobAds)
                return .none
            }
        }
    }

    public init() {}
}
