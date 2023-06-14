import Casimir
import Foundation

public extension Octokit {
  enum StateReason: String, ModelProtocol {
    case completed = "completed"
    case notPlanned = "not_planned"
    case reopened = "reopened"

    public var id: UUID { UUID() }

    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      [
        .completed,
        .notPlanned,
        .reopened
      ]
      .random()
    }
  }
}
