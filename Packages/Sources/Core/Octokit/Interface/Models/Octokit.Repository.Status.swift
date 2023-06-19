import Casimir
import Foundation

public extension Octokit.Repository {
  enum Status: String, ModelProtocol {
    case disabled = "disabled"
    case enabled = "enabled"

    public var id: UUID { UUID() }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      [
        .disabled,
        .enabled
      ]
        .random()
    }
  }
}
