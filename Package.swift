// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UISwift",
	platforms: [
		.iOS(.v12),
		.macOS(.v12)
	],
    products: [
        .library(
            name: "UISwift",
            targets: ["UISwift"]
		),
    ],
    targets: [
        .target(
            name: "UISwift"
		),
        .testTarget(
            name: "UISwiftTests",
            dependencies: ["UISwift"]
        ),
    ]
)
