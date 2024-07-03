// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "core-video-tools",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "CoreVideoTools",
            targets: ["CoreVideoTools"]
        )
    ],
    targets: [
        .target(name: "CoreVideoTools"),
        .testTarget(
            name: "CoreVideoToolsTests",
            dependencies: ["CoreVideoTools"]
        )
    ]
)
