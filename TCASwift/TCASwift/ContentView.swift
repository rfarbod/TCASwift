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

    @State private var isShowingSignIn = false
    @State private var isShowinSignUp = false

    var body: some View {
        NavigationView {
            WithPerceptionTracking {
                ZStack(alignment: .bottom) {
                    VStack {
                        JobAdsView(store: store)
                    }
                    .onAppear {
                        store.send(.getJobs)
                    }

                    HStack {
                        NavigationLink(destination: SignInView(), isActive: $isShowingSignIn) {
                           HeliButton(
                            action: {
                                isShowingSignIn = true
                            },
                            backgroundColor: Color.green,
                            text: "Sign In"
                           )
                        }

                        NavigationLink(destination: SignUpView(), isActive: $isShowinSignUp) {
                            HeliButton(
                             action: {
                                 isShowinSignUp = true
                             },
                             backgroundColor: Color.white,
                             text: "Sign Up"
                            )
                        }
                    }
                    .background(Color.white)
                    .frame(height: 75)
                }
            }
        }
    }
}
