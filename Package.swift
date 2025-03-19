// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftMarkdownEditor",
  products: [
    .library(
      name: "SwiftMarkdownEditor",
      targets: ["SwiftMarkdownEditor"]),
  ],
  targets: [
    .target(
      name: "SwiftMarkdownEditor"
    ),
  ]
)
