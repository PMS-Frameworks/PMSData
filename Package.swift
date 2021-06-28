// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PMSData",
    platforms: [.iOS(.v11), .macOS(.v10_12)],
    products: [
        .library(
            name: "PMSData",
            targets: ["PMSData"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya", from: "14.0.0"),
        .package(url: "https://github.com/PMS-Frameworks/PMSDomain", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "PMSData",
            dependencies: [
                .product(name: "Moya", package: "Moya", condition: .when(platforms: [.iOS])),
                .product(name: "RxMoya", package: "Moya", condition: .when(platforms: [.iOS])),
                "PMSDomain",
            ],
            path: "PMSData/Classes")
    ]
)
