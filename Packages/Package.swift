// swift-tools-version: 5.7

import PackageDescription

// swiftlint:disable explicit_acl
// swiftlint:disable explicit_top_level_acl

// MARK: - Global Constraints

let composableArchitectureRemote = Package.Dependency.package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "0.52.0")
let composableArchitecture = Target.Dependency.product(name: "ComposableArchitecture", package: "swift-composable-architecture")

let swiftUINavigationRemote = Package.Dependency.package(url: "https://github.com/pointfreeco/swiftui-navigation", exact: "0.7.1")
let swiftUINavigation = Target.Dependency.product(name: "SwiftUINavigation", package: "swiftui-navigation")

let keychainAccessRemote = Package.Dependency.package(url: "https://github.com/kishikawakatsumi/KeychainAccess", exact: "4.2.2")
let keychainAccess = Target.Dependency.product(name: "KeychainAccess", package: "KeychainAccess")

let casimirRemote = Package.Dependency.package(path: "../Casimir")
let casimir = Target.Dependency.product(name: "Casimir", package: "Casimir")

let globalDependencies: [Package.Dependency] = [
  composableArchitectureRemote,
  swiftUINavigationRemote,
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

let motif = Target.target(
  name: "Motif",
  path: "Sources/Core/Motif"
)

let composables = Target.target(
  name: "Composables",
  dependencies: [
    composableArchitecture
  ],
  path: "Sources/Core/Composables"
)

let coreTargets: [Target] = [
  octokit,
  octokitLive,
  motif,
  composables
]

// MARK: - Feature Targets definitions and assembly

let loginFeature = Target.target(
  name: "LoginFeature",
  dependencies: [
    composables.dependency,
    composableArchitecture,
    octokit.dependency,
    motif.dependency,
    swiftUINavigation
  ],
  path: "Sources/Features/Login/Sources"
)

let loginFeatureTests = Target.testTarget(
  name: "LoginFeatureTests",
  dependencies: [
    casimir,
    .byName(name: loginFeature.name) // TODO:
  ],
  path: "Sources/Features/Login/Tests"
)

let loginFeaturePreview = Target.executableTarget(
  name: "LoginPreview",
  dependencies: [
    .byName(name: loginFeature.name)
  ],
  path: "Sources/Features/Login/Preview"
)

let userContextFeature = Target.target(
  name: "UserContextFeature",
  dependencies: [
    composables.dependency,
    composableArchitecture,
    octokit.dependency,
    motif.dependency,
    swiftUINavigation
  ],
  path: "Sources/Features/UserContext/Sources"
)

let userContextTests = Target.testTarget(
  name: "UserContextTests",
  dependencies: [
    casimir,
    .byName(name: userContextFeature.name) // TODO:
  ],
  path: "Sources/Features/UserContext/Tests"
)

let userContextPreview = Target.executableTarget(
  name: "UserContextPreview",
  dependencies: [
    .byName(name: userContextFeature.name)
  ],
  path: "Sources/Features/UserContext/Preview"
)

let featureTargets: [Target] = [
  loginFeature,
  loginFeaturePreview,
  userContextFeature,
  userContextPreview
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

let testTargets: [Target] = [
  octokitTests,
  userContextTests,
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
