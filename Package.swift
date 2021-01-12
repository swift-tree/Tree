// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Tree",
  products: [
    .library(
      name: "Tree",
      targets: ["Tree"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Tree",
      dependencies: []),
    .testTarget(
      name: "TreeTests",
      dependencies: ["Tree"]),
  ]
)
