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
    public struct State: Equatable {
        public var jobAds: [JobAd] = []
        public var date: Date = .now

        public init(jobAds: [JobAd], date: Date) {
            self.jobAds = jobAds
            self.date = date
        }

        public static func == (lhs: JobReducer.State, rhs: JobReducer.State) -> Bool {
            lhs.date == rhs.date && lhs.jobAds == rhs.jobAds
        }
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
                return .run { [date = state.date] send in
                    let formattedDate = DateFormatter.iso8601DateFormatter.string(from: date)
                    let jobs = try await JobAdAPI.fetchJobAds(date: formattedDate)
                    await send(.jobsRecieved(jobs: jobs.data))
                }

            case .goToPreviousDate:
                guard let previousDate = Calendar.current.date(
                    byAdding: .day,
                    value: -1,
                    to: state.date
                ) else { return .none }

                state.date = Calendar.current.startOfDay(for: previousDate)
                return .none

            case let .jobsRecieved(jobAds):
                state.jobAds += jobAds
                return .none
            }
        }
    }

    public init() {}
}
