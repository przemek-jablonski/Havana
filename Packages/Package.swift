// swift-tools-version: 5.7

import PackageDescription

// swiftlint:disable explicit_acl
// swiftlint:disable explicit_top_level_acl

// MARK: - Global Constraints

let composableArchitectureRemote = Package.Dependency.package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "0.54.0")
let composableArchitecture = Target.Dependency.product(name: "ComposableArchitecture", package: "swift-composable-architecture")

let swiftUINavigationRemote = Package.Dependency.package(url: "https://github.com/pointfreeco/swiftui-navigation", exact: "0.7.2")
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

let coreTargets: [Target] = [
  octokit,
  octokitLive,
  motif
]

// MARK: - Feature Targets definitions and assembly

let loginFeature = Target.target(
  name: "LoginFeature",
  dependencies: [
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
    .byName(name: loginFeature.name)
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

let activityFeedFeature = Target.target(
  name: "ActivityFeedFeature",
  dependencies: [
    composableArchitecture,
    octokit.dependency,
    motif.dependency,
    swiftUINavigation
  ],
  path: "Sources/Features/ActivityFeed/Sources"
)

let activityFeedTests = Target.testTarget(
  name: "ActivityFeedTests",
  dependencies: [
    casimir,
    .byName(name: activityFeedFeature.name)
  ],
  path: "Sources/Features/ActivityFeed/Tests"
)

let activityFeedPreview = Target.executableTarget(
  name: "ActivityFeedPreview",
  dependencies: [
    .byName(name: activityFeedFeature.name)
  ],
  path: "Sources/Features/ActivityFeed/Preview"
)

let userContextFeature = Target.target(
  name: "UserContextFeature",
  dependencies: [
    composableArchitecture,
    activityFeedFeature.dependency,
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
    .byName(name: userContextFeature.name)
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
  userContextPreview,
  activityFeedFeature,
  activityFeedPreview
]

// MARK: - Testing Targets definitions and assembly

let octokitTests = Target.testTarget(
  name: "OctokitTests",
  dependencies: [
    casimir,
    .byName(name: octokit.name),
    .byName(name: octokitLive.name)
  ],
  path: "Sources/Core/Octokit/Tests",
  resources: [
    // at the time of writing this project SPM is not capable of wildcarding paths, so...
    .copy("Resources/commit_04.json"),
    .copy("Resources/commit_05.json"),
    .copy("Resources/commit_06.json"),
    .copy("Resources/commits_01.json"),
    .copy("Resources/commits_02.json"),
    .copy("Resources/commits_03.json"),
    .copy("Resources/events_1.json"),
    .copy("Resources/events_2.json"),
    .copy("Resources/events_3.json"),
    .copy("Resources/events_4.json"),
    .copy("Resources/events_5.json"),
    .copy("Resources/events_6.json"),
    .copy("Resources/events_7.json"),
    .copy("Resources/events_8.json"),
    .copy("Resources/events_9.json"),
    .copy("Resources/events_10.json"),
    .copy("Resources/events_11.json"),
    .copy("Resources/events_12.json"),
    .copy("Resources/events_13.json"),
    .copy("Resources/events_14.json"),
    .copy("Resources/events_15.json"),
    .copy("Resources/issue_comments_01.json"),
    .copy("Resources/issue_comments_02.json"),
    .copy("Resources/issue_comments_03.json"),
    .copy("Resources/issue_comments_04.json"),
    .copy("Resources/issues_01.json"),
    .copy("Resources/issues_02.json"),
    .copy("Resources/issues_03.json"),
    .copy("Resources/issues_04.json"),
    .copy("Resources/issues_05.json"),
    .copy("Resources/issues_06.json"),
    .copy("Resources/pr_comments_01.json"),
    .copy("Resources/pr_comments_02.json"),
    .copy("Resources/pr_comments_03.json"),
    .copy("Resources/pull_requests_01.json"),
    .copy("Resources/pull_requests_02.json"),
    .copy("Resources/pull_requests_03.json"),
    .copy("Resources/pull_requests_04.json"),
    .copy("Resources/releases_01.json"),
    .copy("Resources/releases_02.json"),
    .copy("Resources/releases_03.json"),
    .copy("Resources/releases_04.json"),
    .copy("Resources/repository_01.json"),
    .copy("Resources/repository_02.json"),
    .copy("Resources/repository_03.json"),
    .copy("Resources/repository_04.json"),
    .copy("Resources/repository_05.json"),
    .copy("Resources/repository_06.json"),
    .copy("Resources/users_01_corrupted.json"),
    .copy("Resources/users_01.json"),
    .copy("Resources/users_02.json"),
    .copy("Resources/users_03.json"),
    .copy("Resources/users_04.json"),
    .copy("Resources/users_05.json")
  ]
)

let testTargets: [Target] = [
  octokitTests,
  userContextTests,
  loginFeatureTests,
  activityFeedTests
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

private func + <Element>(left: Element, right: [Element]) -> [Element] {
  [left] + right
}

// swiftlint:enable explicit_acl
// swiftlint:enable explicit_top_level_acl
