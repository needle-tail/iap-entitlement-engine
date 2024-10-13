// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iap-entitlement-engine",
    platforms: [
        .macOS(.v15),
        .iOS(.v18)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "IAPEntitlementEngine",
            targets: ["IAPEntitlementEngine"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server-community/APNSwift.git", .upToNextMajor(from: "6.0.1")),
        .package(url: "https://github.com/apple/swift-http-types.git", .upToNextMajor(from: "1.3.0")),
        .package(url: "https://github.com/needle-tail/needletail-logger.git", .upToNextMajor(from: "1.0.4")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "IAPEntitlementEngine",
            dependencies: [
                .product(name: "HTTPTypes", package: "swift-http-types"),
                .product(name: "APNS", package: "APNSwift"),
                .product(name: "NeedleTailLogger", package: "needletail-logger"),
            ]
        ),
        .testTarget(
            name: "IAPEntitlementEngineTests",
            dependencies: ["IAPEntitlementEngine"]),
    ]
)
