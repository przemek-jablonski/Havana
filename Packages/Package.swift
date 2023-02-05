// swift-tools-version: 5.7

import PackageDescription

// MARK: - Global Constraints

let globalDependencies: [Package.Dependency] = []

let supportedPlatforms: [SupportedPlatform] = [
  .iOS(.v15),
  .macOS(.v13)
]

// MARK: - Core Targets definitions and assembly

let coreTargets: [Target] = []

// MARK: - Feature Targets definitions and assembly

let loginFeature = Target.target(
  name: "LoginFeature",
  dependencies: [],
  path: "Sources/Features/Login"
)

let featureTargets: [Target] = [
  loginFeature
]

// MARK: - Umbrella product and all targets assembly

let allTargets = coreTargets + featureTargets

let umbrellaProduct = PackageDescription.Product.library(
  name: "Packages",
  targets: allTargets.regularTargets.names
)

// MARK: - Umbrella Package assembly

let package = Package(
  name: "Packages",
  platforms: supportedPlatforms,
  products: umbrellaProduct + allTargets.regularTargets.asLibraryProducts,
  dependencies: globalDependencies,
  targets: allTargets
)

// MARK: - Conveniences

private extension Array where Element == Target {
  var regularTargets: [Target] {
    self.filter { $0.type == .regular }
  }
  
  var asLibraryProducts: [Product] {
    self.map { target in
      PackageDescription.Product.library(
        name: target.name,
        targets: [target.name]
      )
    }
  }
  
  var names: [String] {
    self.map(\.name)
  }
}

private func +<Element>(left: Element, right: [Element]) -> [Element] {
  return [left] + right
}