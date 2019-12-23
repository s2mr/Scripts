// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Scripts",
    dependencies: [
        .package(url: "https://github.com/apple/swift-package-manager.git", from: "0.3.0")
    ],
    targets: [
        .target(
            name: "Scripts",
            dependencies: ["SPMUtility"]),
        .testTarget(
            name: "ScriptsTests",
            dependencies: ["Scripts"]),
    ]
)
