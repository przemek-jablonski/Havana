import Foundation

public extension Octokit {
  typealias ServiceMock = OctokitServiceMock
}

public protocol OctokitServiceMock {
  associatedtype Mock
  func happyPath() -> Mock
  func unhappyPath() -> Mock
  func noResponses() -> Mock
}
