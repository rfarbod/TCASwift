//
//  SwiftUIView.swift
//
//
//  Created by Farbod Rahiminik on 7/18/24.
//

import AppData
import ComposableArchitecture
import SDWebImageSwiftUI
import SwiftUI

struct JobAdView: View {
    private enum Constants {
        static let padding: CGFloat = 5
    }

    let jobAd: JobAd

    var body: some View {
        WithPerceptionTracking {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    WebImage(url: URL(string: jobAd.job.project.client.links.heroImage)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 20).foregroundColor(.gray)
                    }
                    .indicator(.activity)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                    Text("\(jobAd.earningsPerHour.amount) \(jobAd.earningsPerHour.currency)")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.secondary)
                        .padding(Constants.padding)
                        .background(Color.white)
                        .cornerRadius(15, corners: .topLeft)
                }

                HStack(spacing: 0) {
                    Text("\(jobAd.statusText) • ")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(.purple)
                    Text("\(jobAd.startHour)-\(jobAd.endHour)")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(.purple)
                    Spacer()
                }
                .padding(Constants.padding)

                HStack {
                    Text(jobAd.job.project.name)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.primary)
                        .padding(Constants.padding)
                    Spacer()
                }

                Spacer()
            }
        }
    }
}
