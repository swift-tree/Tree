// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "Tree",
  products: [
    .library(
      name: "Tree",
      targets: ["Tree"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Tree",
      dependencies: []
    ),
    .testTarget(
      name: "TreeTests",
      dependencies: ["Tree"]
    ),
  ]
)
