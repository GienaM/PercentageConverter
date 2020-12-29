// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PercentageConverter",
    platforms: [.iOS(.v9), .macOS(.v10_10), .tvOS(.v9)],
    products: [
        .library(
            name: "PercentageConverter",
            targets: ["PercentageConverter"]),
    ],
    targets: [
        .target(
            name: "PercentageConverter",
            dependencies: []),
        .testTarget(
            name: "PercentageConverterTests",
            dependencies: ["PercentageConverter"]),
    ],
    swiftLanguageVersions: [.v5, .v4_2, .v4]
)
