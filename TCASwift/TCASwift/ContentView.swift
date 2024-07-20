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
    @State private var isShowingFilter = false
    @State private var isShowingKart = false

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

                    VStack {
                        HStack {
                            Button(
                                action: {
                                    isShowingFilter = true
                                },
                                label: {
                                    Text("Filter")
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                            )

                            RoundedRectangle(cornerRadius: 0)
                                .frame(width: 1, height: 50)
                                .background(Color.black)

                            Button(
                                action: {

                                },
                                label: {
                                    Text("Kaart")
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                            )
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 1)
                                .cornerRadius(15, corners: [.allCorners])
                        )
                        .background(Color.white)
                        .cornerRadius(15, corners: [.allCorners])
                        .frame(width: 150, height: 50)

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
        .sheet(isPresented: $isShowingFilter) {
            FilterView()
        }
    }
}
