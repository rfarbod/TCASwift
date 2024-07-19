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
            List {
                ForEach(store.jobAds) { jobAd in
                   JobAdView(jobAd: jobAd)
                }
            }
        }
    }
}
