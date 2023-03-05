// swift-tools-version: 5.7

import PackageDescription

// MARK: - Global Constraints

//let composableArchitectureRemote = Package.Dependency.package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "0.50.1")
//let composableArchitectur = Target.Dependency.product(name: "swift-composable-architecture")

let keychainAccessRemote = Package.Dependency.package(url: "https://github.com/kishikawakatsumi/KeychainAccess", exact: "4.2.2")
let keychainAccess = Target.Dependency.product(name: "KeychainAccess", package: "KeychainAccess")

let casimirRemote = Package.Dependency.package(path: "../Casimir")
let casimir = Target.Dependency.product(name: "Casimir", package: "Casimir")

let globalDependencies: [Package.Dependency] = [
//  composableArchitectureRemote,
  casimirRemote,
  keychainAccessRemote
]

let supportedPlatforms: [SupportedPlatform] = [
  .iOS(.v15),
  .macOS(.v13)
]

// MARK: - Core Targets definitions and assembly

let octokit = Target.target(
  name: "Octokit",
  dependencies: [
    casimir,
    keychainAccess
  ],
  path: "Sources/Core/Octokit"
)

let coreTargets: [Target] = [
  octokit
]

// MARK: - Feature Targets definitions and assembly

let loginFeature = Target.target(
  name: "LoginFeature",
  dependencies: [
    casimir,
    octokit.asDependency
  ],
  path: "Sources/Features/Login"
)

let featureTargets: [Target] = [
  loginFeature
]

// MARK: - Testing Targets definitions and assembly

let octokitTests = Target.testTarget(
  name: "OctokitTests",
  dependencies: [
    .byName(name: octokit.name),
    casimir
  ],
  path: "Tests/Core/Octokit"
)

let testTargets: [Target] = [
  octokitTests
//  loginFeatureTests
]

// MARK: - Umbrella product and all targets assembly

let allTargets = coreTargets + featureTargets + testTargets

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
  
  var testTargets: [Target] {
    self.filter { $0.type == .test }
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

private extension Target {
  var asDependency: Target.Dependency {
    Target.Dependency(stringLiteral: self.name)
  }
}

private func +<Element>(left: Element, right: [Element]) -> [Element] {
  return [left] + right
}
