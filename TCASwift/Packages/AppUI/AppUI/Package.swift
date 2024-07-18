// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppUI",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AppUI",
            targets: ["AppUI"]),
    ],
    dependencies: [
        .package(path: "../../AppData"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.1.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AppUI",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                "AppData"
            ]
        ),
        .testTarget(
            name: "AppUITests",
            dependencies: ["AppUI"]),
    ]
)
