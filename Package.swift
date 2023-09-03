// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OneSignal",
    products: [
        .library(
            name: "OneSignal",
            targets: ["OneSignalWrapper"]),
        .library(
            name: "OneSignalExtension",
            targets: ["OneSignalExtensionWrapper"])
    ],
    targets: [
        .target(
            name: "OneSignalWrapper",
            dependencies: [
                "OneSignal",
                "OneSignalExtension",
                "OneSignalOutcomes",
                "OneSignalCore"
            ],
            path: "OneSignalWrapper"
        ),
        .target(
            name: "OneSignalExtensionWrapper",
            dependencies: [
                "OneSignalExtension",
                "OneSignalOutcomes",
                "OneSignalCore"
            ],
            path: "OneSignalExtensionWrapper"
        ),
        .target(
            name: "OneSignalOutcomesWrapper",
            dependencies: [
                "OneSignalOutcomes",
                "OneSignalCore"
            ],
            path: "OneSignalOutcomesWrapper"
        ),
        .binaryTarget(
          name: "OneSignal",
          url: "https://github.com/Saturn-Technologies/OneSignal-iOS-SDK/releases/download/3.12.9/OneSignal.xcframework.zip",
          checksum: "958035d6f44100f7e718279c513d558ebcee6e83d76a198cea65a334658f361e"
        ),
        .binaryTarget(
          name: "OneSignalExtension",
          url: "https://github.com/Saturn-Technologies/OneSignal-iOS-SDK/releases/download/3.12.9/OneSignalExtension.xcframework.zip",
          checksum: "bad4f1bbfe675f36e04b05567583273cd0624709b2c248bc631d6fe69cc7ddb6"
        ),
        .binaryTarget(
          name: "OneSignalOutcomes",
          url: "https://github.com/Saturn-Technologies/OneSignal-iOS-SDK/releases/download/3.12.9/OneSignalOutcomes.xcframework.zip",
          checksum: "962dda99792fbe8c06897c303e7e5c4ac12f21fab0877394a32e4dae2e147260"
        ),
        .binaryTarget(
          name: "OneSignalCore",
          url: "https://github.com/Saturn-Technologies/OneSignal-iOS-SDK/releases/download/3.12.9/OneSignalCore.xcframework.zip",
          checksum: "4e922adf8bcee715cff5811797008e0c627315413dca1d3334642de162d4260b"
        )
    ]
)
