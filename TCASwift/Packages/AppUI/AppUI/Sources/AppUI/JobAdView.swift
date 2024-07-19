//
//  SwiftUIView.swift
//  
//
//  Created by Farbod Rahiminik on 7/18/24.
//

import AppData
import SDWebImageSwiftUI
import SwiftUI

struct JobAdView: View {
    private enum Constants {
        static let padding: CGFloat = 25
        static let spacing: CGFloat = 20
        static let imageHeight: CGFloat = 300
    }

    let jobAd: JobAd

    var body: some View {
        VStack(spacing: Constants.spacing) {
            WebImage(url: URL(string: jobAd.job.project.client.links.heroImage)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle().foregroundColor(.gray)
            }
            .indicator(.activity)

            HStack {
                Text(jobAd.statusText)
                    .padding(.horizontal, Constants.padding)
                Spacer()
                Text("\(jobAd.earningsPerHour.amount) \(jobAd.earningsPerHour.currency)")
                    .font(.system(size: 14, weight: .medium))
                    .padding(.horizontal, Constants.padding)
            }

            HStack {
                Text(jobAd.job.project.name)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.horizontal, Constants.padding)
                Spacer()
            }
        }
    }
}
