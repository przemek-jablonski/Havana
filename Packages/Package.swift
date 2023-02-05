// swift-tools-version: 5.7

import PackageDescription

let globalDependencies: [Package.Dependency] = []

let platforms: [SupportedPlatform] = [
  .iOS(.v15),
  .macOS(.v13)
]

let featureTargets: [Target] = [
  .target(
    name: "LoginFeature",
    path: "Sources/Features/Login"
  )
]

let coreTargets: [Target] = []

let allTargets = coreTargets + featureTargets

let umbrellaProduct = PackageDescription.Product.library(
  name: "Packages",
  targets: allTargets.regularTargets.names
)

let package = Package(
  name: "Packages",
  platforms: platforms,
  products: umbrellaProduct + allTargets.regularTargets.asLibraryProducts,
  dependencies: globalDependencies,
  targets: allTargets
)

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
