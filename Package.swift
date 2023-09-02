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
          url: "https://github.com/Saturn-Technologies/OneSignal-iOS-SDK/releases/download/3.12.8/OneSignal.xcframework.zip",
          checksum: "0bb25babef943b6ed88853806ae4d57816f5ffb26a515669b0fb1ddeacd668a6"
        ),
        .binaryTarget(
          name: "OneSignalExtension",
          url: "https://github.com/Saturn-Technologies/OneSignal-iOS-SDK/releases/download/3.12.8/OneSignalExtension.xcframework.zip",
          checksum: "9e65dd8875b058da36bd847f15d2f61cce9165125faeddf03a1183e4426dfe67"
        ),
        .binaryTarget(
          name: "OneSignalOutcomes",
          url: "https://github.com/Saturn-Technologies/OneSignal-iOS-SDK/releases/download/3.12.8/OneSignalOutcomes.xcframework.zip",
          checksum: "65556e3960f9f486794a7a13f34dd787b98f63bd8e1ba4e26056f0ab9f0808ce"
        ),
        .binaryTarget(
          name: "OneSignalCore",
          url: "https://github.com/Saturn-Technologies/OneSignal-iOS-SDK/releases/download/3.12.8/OneSignalCore.xcframework.zip",
          checksum: "a934d200ec5d46e356df740436dbfcf0a58e4879ee775254b1732dd08c837215"
        )
    ]
)
