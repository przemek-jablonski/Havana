import Casimir
import Foundation

public extension Octokit.Milestone {
  enum State: String, ModelProtocol {
    case closed = "closed"
    case open = "open"

    public var id: UUID { UUID() }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      [
        .closed,
        .open
      ]
      .random()
    }
  }
}
