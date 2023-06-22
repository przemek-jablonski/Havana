import Casimir
import Foundation

public extension Octokit.Release.Asset {
  /// State of the release asset.
  enum State: String, ModelProtocol {
    case stateOpen = "open"
    case uploaded = "uploaded"

    public var id: UUID { UUID() }

    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      [.stateOpen, .uploaded].random()
    }
  }
}
