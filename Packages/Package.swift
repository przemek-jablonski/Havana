// swift-tools-version: 5.7

import PackageDescription

// MARK: - Global Constraints

let composableArchitectureRemote = Package.Dependency.package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "0.51.0")
let composableArchitecture = Target.Dependency.product(name: "ComposableArchitecture", package: "swift-composable-architecture")

let keychainAccessRemote = Package.Dependency.package(url: "https://github.com/kishikawakatsumi/KeychainAccess", exact: "4.2.2")
let keychainAccess = Target.Dependency.product(name: "KeychainAccess", package: "KeychainAccess")

let casimirRemote = Package.Dependency.package(path: "../Casimir")
let casimir = Target.Dependency.product(name: "Casimir", package: "Casimir")

let globalDependencies: [Package.Dependency] = [
  composableArchitectureRemote,
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
    casimir // TODO: this could be removed
  ],
  path: "Sources/Core/Octokit/Interface"
)

let octokitLive = Target.target(
  name: "OctokitLive",
  dependencies: [
    casimir, // TODO: this could be removed
    octokit.dependency,
    keychainAccess
  ],
  path: "Sources/Core/Octokit/Live"
)

let Motif = Target.target(
  name: "Motif",
  path: "Sources/Core/Motif"
)

let coreTargets: [Target] = [
  octokit,
  octokitLive,
  Motif
]

// MARK: - Feature Targets definitions and assembly

let loginFeature = Target.target(
  name: "LoginFeature",
  dependencies: [
    Motif.dependency,
    composableArchitecture,
    octokit.dependency
  ],
  path: "Sources/Features/Login/Sources"
)

let loginFeaturePreview = Target.executableTarget(
  name: "LoginPreview",
  dependencies: [
    .byName(name: loginFeature.name)
  ],
  path: "Sources/Features/Login/Preview"
)

let featureTargets: [Target] = [
  loginFeature,
  loginFeaturePreview
]

// MARK: - Testing Targets definitions and assembly

let octokitTests = Target.testTarget(
  name: "OctokitTests",
  dependencies: [
    casimir,
    .byName(name: octokit.name) // TODO:
  ],
  path: "Tests/Core/Octokit"
)

let loginFeatureTests = Target.testTarget(
  name: "LoginFeatureTests",
  dependencies: [
    casimir,
    .byName(name: loginFeature.name) // TODO:
  ],
  path: "Sources/Features/Login/Tests"
)


let testTargets: [Target] = [
  octokitTests,
  loginFeatureTests
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
  products: umbrellaProduct + allTargets.regularTargets.libraries,
  dependencies: globalDependencies,
  targets: allTargets
)

// MARK: - Conveniences

private extension Target {
  /**
   Returns this `Target` in a `Dependency` format, to be linked as a dependency for other `Product`s or `Target`s.
   */
  var dependency: Target.Dependency {
    Target.Dependency(stringLiteral: self.name)
  }
  
  /**
   Returns this `Target` as a `Product`, in `Library` format. Can be linked as a product of any `Package`.
   */
  var library: Product {
    PackageDescription.Product.library(
      name: self.name,
      targets: [self.name]
    )
  }
}

private extension Array where Element == Target {
  var regularTargets: [Target] {
    self.filter { $0.type == .regular }
  }
  
  var testTargets: [Target] {
    self.filter { $0.type == .test }
  }
  
  var libraries: [Product] {
    self.map(\.library)
  }
  
  var names: [String] {
    self.map(\.name)
  }
}

private func +<Element>(left: Element, right: [Element]) -> [Element] {
  [left] + right
}
