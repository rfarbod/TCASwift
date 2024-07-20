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

    private enum Constant {
        static let filterImageName = "line.3.horizontal.decrease.circle"
        static let mapImageName = "map.circle"
    }

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
                        HStack(alignment: .center) {
                            Button(
                                action: {
                                    isShowingFilter = true
                                },
                                label: {
                                    (Text(Image(systemName: Constant.filterImageName)) + Text(" Filter"))
                                        .foregroundStyle(.gray)
                                        .cornerRadius(25, corners: [.topLeft, .bottomLeft])
                                }
                            )

                            RoundedRectangle(cornerRadius: 0)
                                .frame(width: 1, height: 45)
                                .background(.gray)

                            Button(
                                action: {
                                    isShowingKart = true
                                },
                                label: {
                                    (Text(Image(systemName: Constant.mapImageName)) + Text(" Kaart"))
                                        .foregroundStyle(.gray)
                                        .cornerRadius(25, corners: [.topRight, .bottomRight])
                                }
                            )
                        }
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(25, corners: .allCorners)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 1)
                        )

                        HStack {
                            NavigationLink(destination: SignInView(), isActive: $isShowingSignIn) {
                                HeliButton(
                                    action: {
                                        isShowingSignIn = true
                                    },
                                    foregroundColor: .white,
                                    backgroundColor: .green,
                                    text: "Sign In"
                                )
                            }

                            NavigationLink(destination: SignUpView(), isActive: $isShowinSignUp) {
                                HeliButton(
                                    action: {
                                        isShowinSignUp = true
                                    },
                                    foregroundColor: .secondary,
                                    backgroundColor: .white,
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
        .sheet(isPresented: $isShowingKart) {
            KaartView()
        }
    }
}
