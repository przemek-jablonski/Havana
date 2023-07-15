// swift-tools-version: 5.7

import PackageDescription

// swiftlint:disable explicit_acl
// swiftlint:disable explicit_top_level_acl

// MARK: - Global Constraints

let composableArchitectureRemote = Package.Dependency.package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "0.54.0")
let composableArchitecture = Target.Dependency.product(name: "ComposableArchitecture", package: "swift-composable-architecture")

let swiftUINavigationRemote = Package.Dependency.package(url: "https://github.com/pointfreeco/swiftui-navigation", exact: "0.7.2") // TODO: remove this - ships with TCA already
let swiftUINavigation = Target.Dependency.product(name: "SwiftUINavigation", package: "swiftui-navigation")

let keychainAccessRemote = Package.Dependency.package(url: "https://github.com/kishikawakatsumi/KeychainAccess", exact: "4.2.2")
let keychainAccess = Target.Dependency.product(name: "KeychainAccess", package: "KeychainAccess")

let casimirRemote = Package.Dependency.package(path: "../Casimir")
let casimir = Target.Dependency.product(name: "Casimir", package: "Casimir")

// ##############################################################
// MARK: - REMOTE DEPENDENCIES ASSEMBLY
// ##############################################################

let globalDependencies: [Package.Dependency] = [
  composableArchitectureRemote,
  swiftUINavigationRemote,
  casimirRemote,
  keychainAccessRemote
]

// ##############################################################
// MARK: - PLATFORM SUPPORT
// ##############################################################

let supportedPlatforms: [SupportedPlatform] = [
  .iOS(.v16),
  .macOS(.v13)
]

// MARK: - Octokit internal library

let octokit = Target.target(
  name: "Octokit",
  dependencies: [
    casimir,
    composableArchitecture
  ],
  path: "Sources/Core/Octokit/Interface"
)

let octokitLive = Target.target(
  name: "OctokitLive",
  dependencies: [
    casimir,
    composableArchitecture,
    octokit.dependency,
    keychainAccess
  ],
  path: "Sources/Core/Octokit/Live"
)

let octokitTests = Target.testTarget(
  name: "OctokitTests",
  dependencies: [
    casimir,
    .byName(name: octokit.name),
    .byName(name: octokitLive.name)
  ],
  path: "Sources/Core/Octokit/Tests",
  resources: [
    // at the time of writing this project SPM is not capable of wildcarding paths, sooo...
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
    .copy("Resources/events_16.json"),
    .copy("Resources/events_17.json"),
    .copy("Resources/events_18.json"),
    .copy("Resources/events_19.json"),
    .copy("Resources/events_20.json"),
    .copy("Resources/events_21.json"),
    .copy("Resources/events_22.json"),
    .copy("Resources/events_23.json"),
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

// MARK: - Motif internal library

let motif = Target.target(
  name: "Motif",
  dependencies: [
    casimir
  ],
  path: "Sources/Core/Motif"
)

// ##############################################################
// MARK: - INTERNAL LIBRARIES ASSEMBLY
// ##############################################################

let coreTargets: [Target] = [
  octokit,
  octokitLive,
  motif
]

// MARK: - Login feature

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

// MARK: - Release Details feature

let releaseDetailsFeature = Target.target(
  name: "ReleaseDetailsFeature",
  dependencies: [
    composableArchitecture,
    octokit.dependency,
    motif.dependency
  ],
  path: "Sources/Features/ReleaseDetails/Sources"
)

let releaseDetailsTests = Target.testTarget(
  name: "ReleaseDetailsTests",
  dependencies: [
    .byName(name: releaseDetailsFeature.name)
  ],
  path: "Sources/Features/ReleaseDetails/Tests"
)

let releaseDetailsPreview = Target.executableTarget(
  name: "ReleaseDetailsPreview",
  dependencies: [
    .byName(name: releaseDetailsFeature.name)
  ],
  path: "Sources/Features/ReleaseDetails/Preview"
)

// MARK: - Events List feature

let eventsListFeature = Target.target(
  name: "EventsListFeature",
  dependencies: [
    composableArchitecture,
    octokit.dependency,
    motif.dependency,
    releaseDetailsFeature.dependency
  ],
  path: "Sources/Features/EventsList/Sources"
)

let eventsListTests = Target.testTarget(
  name: "EventsListTests",
  dependencies: [
    .byName(name: eventsListFeature.name)
  ],
  path: "Sources/Features/EventsList/Tests"
)

let eventsListPreview = Target.executableTarget(
  name: "EventsListPreview",
  dependencies: [
    .byName(name: eventsListFeature.name)
  ],
  path: "Sources/Features/EventsList/Preview"
)

// MARK: - Repository View feature

let repositoryViewFeature = Target.target(
  name: "RepositoryViewFeature",
  dependencies: [
    composableArchitecture,
    octokit.dependency,
    motif.dependency
  ],
  path: "Sources/Features/RepositoryView/Sources"
)

let repositoryViewTests = Target.testTarget(
  name: "RepositoryViewTests",
  dependencies: [
    .byName(name: repositoryViewFeature.name)
  ],
  path: "Sources/Features/RepositoryView/Tests"
)

let repositoryViewPreview = Target.executableTarget(
  name: "RepositoryViewPreview",
  dependencies: [
    .byName(name: repositoryViewFeature.name)
  ],
  path: "Sources/Features/RepositoryView/Preview"
)

// MARK: - Explore Feed feature

let exploreFeedFeature = Target.target(
  name: "ExploreFeedFeature",
  dependencies: [
    composableArchitecture,
    eventsListFeature.dependency,
    octokit.dependency,
    motif.dependency
  ],
  path: "Sources/Features/ExploreFeed/Sources"
)

let exploreFeedTests = Target.testTarget(
  name: "ExploreFeedTests",
  dependencies: [
    .byName(name: exploreFeedFeature.name)
  ],
  path: "Sources/Features/ExploreFeed/Tests"
)

let exploreFeedPreview = Target.executableTarget(
  name: "ExploreFeedPreview",
  dependencies: [
    .byName(name: exploreFeedFeature.name)
  ],
  path: "Sources/Features/ExploreFeed/Preview"
)

// MARK: - Activity Feed feature

let activityFeedFeature = Target.target(
  name: "ActivityFeedFeature",
  dependencies: [
    composableArchitecture,
    eventsListFeature.dependency,
    octokit.dependency,
    releaseDetailsFeature.dependency,
    motif.dependency,
    swiftUINavigation
  ],
  path: "Sources/Features/ActivityFeed/Sources"
)

let activityFeedTests = Target.testTarget(
  name: "ActivityFeedTests",
  dependencies: [
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

// MARK: - User Context feature

let userContextFeature = Target.target(
  name: "UserContextFeature",
  dependencies: [
    composableArchitecture,
    activityFeedFeature.dependency,
    exploreFeedFeature.dependency,
    octokit.dependency,
    motif.dependency,
    swiftUINavigation
  ],
  path: "Sources/Features/UserContext/Sources"
)

let userContextTests = Target.testTarget(
  name: "UserContextTests",
  dependencies: [
    .byName(name: userContextFeature.name)
  ],
  path: "Sources/Features/UserContext/Tests"
)

// ##############################################################
// MARK: - FEATURE LIBRARIES ASSEMBLY
// ##############################################################

let featureTargets: [Target] = [
  activityFeedFeature,
  activityFeedPreview,
  eventsListFeature,
  eventsListPreview,
  exploreFeedFeature,
  exploreFeedPreview,
  loginFeature,
  loginFeaturePreview,
  releaseDetailsFeature,
  releaseDetailsPreview,
  repositoryViewFeature,
  repositoryViewPreview,
  userContextFeature
]

// ##############################################################
// MARK: - TEST LIBRARIES ASSEMBLY
// ##############################################################

let testTargets: [Target] = [
  octokitTests,
  activityFeedTests,
  eventsListTests,
  exploreFeedTests,
  loginFeatureTests,
  releaseDetailsTests,
  repositoryViewTests,
  userContextTests
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
