// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "apple-kit",
    platforms: [
        .macOS(.v11),
        .iOS(.v14),
        .tvOS(.v14),
        .watchOS(.v8),
    ],
    products: [
        .library(name: "AppleKit", targets: ["AppleKit"]),
    ],
    dependencies: [
        .package(url: "git@github.com:BinaryBirds/core-kit", .branch("main")),
    ],
    targets: [
        .target(name: "AppleKit", dependencies: [
            .product(name: "CoreKit", package: "core-kit"),
        ]),
        .testTarget(name: "AppleKitTests", dependencies: [
            .target(name: "AppleKit")
        ]),
    ]
)
