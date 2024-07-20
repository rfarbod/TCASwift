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
                            Button(
                                action: {
                                    isShowingSignIn = true
                                },
                                label: {
                                    Text("Sign In")
                                        .font(.system(size: 15, weight: .bold))
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(Color.black, lineWidth: 1)
                                        )
                                }
                            )
                            .background(Color.green)
                            .cornerRadius(15)
                            .padding(10)
                        }

                        NavigationLink(destination: SignUpView(), isActive: $isShowinSignUp) {
                            Button(
                                action: {
                                    isShowinSignUp = true
                                },
                                label: {
                                    Text("Sign Up")
                                        .font(.system(size: 15, weight: .bold))
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(Color.black, lineWidth: 1)
                                        )
                                }
                            )
                            .background(Color.white)
                            .padding(10)
                        }
                    }
                    .background(Color.white)
                    .frame(height: 75)
                }
            }
        }
    }
}
