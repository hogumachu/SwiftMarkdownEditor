// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftMarkdownEditor",
  platforms: [
    .iOS(.v12),
  ],
  products: [
    .library(
      name: "SwiftMarkdownEditor",
      targets: ["SwiftMarkdownEditor"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/johnxnguyen/Down.git",
      from: "0.11.0"
    ),
  ],
  targets: [
    .target(
      name: "SwiftMarkdownEditor",
      dependencies: ["Down"]
    ),
  ]
)
