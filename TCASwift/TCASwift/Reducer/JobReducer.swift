//
//  JobReducer.swift
//  TCASwift
//
//  Created by Farbod Rahiminik on 7/16/24.
//

import AppData
import ComposableArchitecture
import Foundation

@Reducer
struct JobReducer {
    @ObservableState
    struct State {
        var jobs: [JobAd] = []
    }

    enum Action {
        case jobsFetched([JobAd])
    }
}
