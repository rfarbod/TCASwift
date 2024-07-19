//
//  SwiftUIView.swift
//  
//
//  Created by Farbod Rahiminik on 7/18/24.
//

import AppFoundation
import ComposableArchitecture
import SwiftUI

public struct JobAdsView: View {
    let store: StoreOf<JobReducer>

    public init(store: StoreOf<JobReducer>) {
        self.store = store
    }

    public var body: some View {
        VStack {
            List(store.jobAds.indices, id: \.self) { index in
                JobAdView(jobAd: store.jobAds[index])
                    .onAppear {
                        if index == store.jobAds.count - 1 {
                            store.send(.goToPreviousDate)
                            store.send(.getJobs)
                        }
                    }
            }
            .listStyle(.plain)
        }
    }
}
