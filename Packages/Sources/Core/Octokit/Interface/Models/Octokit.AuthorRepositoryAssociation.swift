import Casimir
import Foundation

// swiftlint:disable discouraged_none_name
public extension Octokit {
  /// How the author is associated with the repository.
  enum AuthorRepositoryAssociation: String, CaseIterable, ModelProtocol {
    case collaborator = "COLLABORATOR"
    case contributor = "CONTRIBUTOR"
    case firstTimeContributor = "FIRST_TIME_CONTRIBUTOR"
    case firstTimer = "FIRST_TIMER"
    case mannequin = "MANNEQUIN"
    case member = "MEMBER"
    case none = "NONE"
    case owner = "OWNER"

    public var id: UUID { UUID() }

    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self.allCases.random()
    }
  }
}
// swiftlint:enable discouraged_none_name
