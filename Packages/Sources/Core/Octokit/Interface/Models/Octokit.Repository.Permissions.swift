import Casimir
import Foundation

public extension Octokit.Repository {
  struct Permissions: ModelProtocol {
    public let admin: Bool
    public let maintain: Bool?
    public let pull: Bool
    public let push: Bool
    public let triage: Bool?
    public let id = UUID()

    internal enum CodingKeys: String, CodingKey {
      case admin = "admin"
      case maintain = "maintain"
      case pull = "pull"
      case push = "push"
      case triage = "triage"
    }

    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        admin: .random(),
        maintain: .random(),
        pull: .random(),
        push: .random(),
        triage: .random()
      )
    }
  }
}
