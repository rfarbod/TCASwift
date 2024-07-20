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
        static let padding: CGFloat = 15
        static let spacing: CGFloat = 20
    }

    let jobAd: JobAd

    var body: some View {
        WithPerceptionTracking {
            VStack(spacing: Constants.spacing) {
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
                        .font(.system(size: 14, weight: .medium))
                        .padding(Constants.padding)
                        .background(Color.white)
                }

                HStack {
                    Text(jobAd.statusText)
                        .padding(.horizontal, Constants.padding)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(jobAd.isOpen ? Color.green : Color.red)
                    Spacer()
                }

                HStack {
                    Text(jobAd.job.project.name)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.horizontal, Constants.padding)
                    Spacer()
                }

                HStack {
                    Text("\(jobAd.startHour) - \(jobAd.endHour)")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.horizontal, Constants.padding)
                        .foregroundStyle(Color.blue)
                    Spacer()
                }

                Spacer()
            }
        }
    }
}
