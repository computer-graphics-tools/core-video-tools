// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "swifty-iosurface",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "swifty-iosurface",
            targets: ["swifty-iosurface"]
        )
    ],
    targets: [
        .target(
            name: "swifty-iosurface"
        )
    ]
)
