import Casimir
import Foundation

extension Octokit {
  public enum StateReason: String, ModelProtocol {
    case completed = "completed"
    case notPlanned = "not_planned"
    case reopened = "reopened"

    public var id: UUID { UUID() }
    public static var random: Octokit.StateReason {
      [.completed, .notPlanned, .reopened].random
    }
  }
}
