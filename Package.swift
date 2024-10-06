// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftMilSymbol",
    platforms: [
        .iOS(.v15),
        .macOS(.v13),
        .tvOS(.v16),
        .watchOS(.v10),
        .visionOS(.v1)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftMilSymbol",
            targets: ["SwiftMilSymbol"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swhitty/SwiftDraw.git", from: "0.17.0")
    ],
    targets: [
        .target(
            name: "SwiftMilSymbol",
            dependencies: [
                .product(name: "SwiftDraw", package: "SwiftDraw"),
            ],
            resources: [
                .process("JavaScript/dist/SwiftMilSymbol.bundle.js")
            ]
        ),
        .testTarget(
            name: "SwiftMilSymbolTests",
            dependencies: ["SwiftMilSymbol"]),
    ]
)
