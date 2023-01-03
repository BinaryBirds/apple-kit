// swift-tools-version:5.7
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
    ],
    targets: [
        .target(name: "AppleKit", dependencies: [

        ]),
        .testTarget(name: "AppleKitTests", dependencies: [
            .target(name: "AppleKit")
        ]),
    ]
)
