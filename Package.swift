// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SugarUI",
	platforms: [
		.iOS(.v12),
		.macOS(.v12)
	],
    products: [
        .library(
            name: "SugarUI",
            targets: ["SugarUI"]
		),
    ],
    targets: [
        .target(
            name: "SugarUI"
		),
        .testTarget(
            name: "SugarUITests",
            dependencies: ["SugarUI"]
        ),
    ]
)
