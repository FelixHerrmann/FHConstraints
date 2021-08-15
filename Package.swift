// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FHConstraints",
    platforms: [
        .macOS(.v10_11),
        .iOS(.v9),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "FHConstraints",
            targets: ["FHConstraints"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FHConstraints",
            dependencies: []),
        .testTarget(
            name: "FHConstraintsTests",
            dependencies: ["FHConstraints"]),
    ]
)
