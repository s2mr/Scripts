// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Scripts",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.1.3")
    ],
    targets: [
        .target(
            name: "Scripts",
            dependencies: ["ArgumentParser"]),
        .testTarget(
            name: "ScriptsTests",
            dependencies: ["Scripts"]),
    ]
)
