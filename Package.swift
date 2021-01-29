// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LottiePlayer",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "LottiePlayer",
            targets: ["LottiePlayer"]),
    ],
    dependencies: [
        .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios", from: "3.1.9")
    ],
    targets: [
        .target(
            name: "LottiePlayer",
            dependencies: ["Lottie"])
    ]
)
