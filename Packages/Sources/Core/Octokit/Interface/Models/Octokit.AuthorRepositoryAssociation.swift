import Casimir

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

    public static var random: Self {
      Self.allCases.random
    }

    public var id: RawValue { rawValue }
  }
}
