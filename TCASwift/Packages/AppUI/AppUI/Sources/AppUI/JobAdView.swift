//
//  SwiftUIView.swift
//  
//
//  Created by Farbod Rahiminik on 7/18/24.
//

import AppData
import SwiftUI

struct JobAdView: View {
    let jobAd: JobAd

    var body: some View {
        HStack {
            Text(jobAd.job.project.name)
                .font(.system(size: 15, weight: .regular))
        }
    }
}

#Preview {
    JobAdView(jobAd: .init(
        id: "",
        startAt: Date(),
        endsAt: Date(),
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
