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
          url: "https://github.com/Saturn-Technologies/OneSignal-iOS-SDK/releases/download/3.12.7/OneSignal.xcframework.zip",
          checksum: "7734b8574499e9c901420ab3ffad3216add9a9a2946157e8705a7582797b5e44"
        ),
        .binaryTarget(
          name: "OneSignalExtension",
          url: "https://github.com/Saturn-Technologies/OneSignal-iOS-SDK/releases/download/3.12.7/OneSignalExtension.xcframework.zip",
          checksum: "eb4c5379b1157975e843f8a802eb6c96e2f4f9aefab82343c9c16ae3a407c8e0"
        ),
        .binaryTarget(
          name: "OneSignalOutcomes",
          url: "https://github.com/Saturn-Technologies/OneSignal-iOS-SDK/releases/download/3.12.7/OneSignalOutcomes.xcframework.zip",
          checksum: "4062685048a64bdc47a9e638c74f1f270b2d97985ae48f2d75deda6200c524af"
        ),
        .binaryTarget(
          name: "OneSignalCore",
          url: "https://github.com/Saturn-Technologies/OneSignal-iOS-SDK/releases/download/3.12.7/OneSignalCore.xcframework.zip",
          checksum: "99ae69ffbf74a2d9045a546b32e65b08d2f2415187e44e1690c5e21616c0c09c"
        )
    ]
)
