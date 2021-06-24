// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PMSData",
    products: [
        .library(
            name: "PMSData",
            targets: ["PMSData"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya", from: "14.0.0"),
        .package(url: "https://github.com/PMS-Frameworks/PMSRxModule", .branch("master")),
        .package(url: "https://github.com/PMS-Frameworks/PMSDomain", .branch("master")),
    ],
    targets: [
        .target(
            name: "PMSData",
            dependencies: [
                .product(name: "Moya", package: "Moya", condition: .when(platforms: [.iOS])),
                "PMSRxModule",
            ]),
        .testTarget(
            name: "PMSDataTests",
            dependencies: ["PMSData"]),
    ]
)
