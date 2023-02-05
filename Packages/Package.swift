// swift-tools-version: 5.7

import PackageDescription

let globalDependencies: [Package.Dependency] = [
]

let platforms: [SupportedPlatform] = [
  .iOS(.v15),
  .macOS(.v13)
]

let package = Package(
  name: "Packages",
  platforms: platforms,
  products: [
    .library(
      name: "Packages",
      targets: ["Packages"]
    ),
  ],
  dependencies: globalDependencies,
  targets: [
    .target(
      name: "Packages",
      dependencies: []
    ),
  ]
)
