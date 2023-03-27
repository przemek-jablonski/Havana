import Foundation

public extension Octokit {
  typealias ServiceMock = OctokitServiceMock
}

public protocol OctokitServiceMock {
  associatedtype Mock

  static func happyPath() -> Mock
  static func unhappyPath() -> Mock
  static func noResponses() -> Mock
}
