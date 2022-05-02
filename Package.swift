// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "core-video-tools",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "CoreVideoTools",
            targets: ["CoreVideoTools"]
        )
    ],
    targets: [
        .target(name: "CoreVideoTools")
    ]
)
