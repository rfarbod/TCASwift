//
//  JobReducer.swift
//
//
//  Created by Farbod Rahiminik on 7/18/24.
//

import AppData
import ComposableArchitecture

@Reducer
public struct JobReducer {
    @ObservableState
    public struct State {
        public var jobAds: [JobAd] = []
    }

    public enum Action {
        case jobsRecieved([JobAd])
    }
}
