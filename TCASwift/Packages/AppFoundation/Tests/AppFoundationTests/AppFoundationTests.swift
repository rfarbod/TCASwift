import AppData
import ComposableArchitecture
import XCTest

@testable import AppFoundation

final class AppFoundationTests: XCTestCase {
    @MainActor
    func testPreviousDate() async {
        let store = TestStore(initialState: JobReducer.State(
            jobAds: [],
            date: Date()
        ), reducer: {
            JobReducer()
        })

        await store.send(.goToPreviousDate) {
            guard var yesterdayDate = Calendar.current.date(byAdding: .day, value: -1, to: Date()) else { return }
            yesterdayDate = Calendar.current.startOfDay(for: yesterdayDate)

            $0.date = yesterdayDate
        }
    }

    @MainActor
    func testJobsAppended() async {
        let store = TestStore(initialState: JobReducer.State(
            jobAds: [],
            date: Date()
        ), reducer: {
            JobReducer()
        })

        let sampleJob: JobAd = .init(
            id: "jobId1",
            startAt: "",
            endsAt: "",
            earningsPerHour: .init(currency: .euro, amount: 0),
            job: .init(
                id: "jobId1",
                reportAtAddress: .init(
                    geo: .init(
                        lat: 0,
                        lon: 0
                    )
                ),
                project: .init(
                    id: "",
                    name: "",
                    client: .init(id: "", links: .init(heroImage: "", thumbImage: ""))
                )
            )
        )

        await store.send(.jobsRecieved(jobs: [sampleJob])) {
            $0.jobAds = [sampleJob]
        }
    }
}
