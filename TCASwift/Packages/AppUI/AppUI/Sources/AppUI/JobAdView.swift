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
                image.resizable()
            } placeholder: {
                Rectangle().foregroundColor(.gray)
            }
            .indicator(.activity)
            .frame(height: Constants.imageHeight)

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

#Preview {
    JobAdView(jobAd: .init(
        id: "",
        startAt: "Date()",
        endsAt: "Date()",
        earningsPerHour: .init(currency: Currency.euro, amount: 20),
        job: .init(
            id: "",
            reportAtAddress: .init(geo: .init(lat: 0, lon: 0)),
            project: .init(
                id: "",
                name: "Job",
                client: .init(
                    id: "",
                    links: .init(heroImage: "", thumbImage: "")
                )
            )
        )
    ))
}
