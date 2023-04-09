import Casimir
import Foundation

public extension Octokit {
  struct Milestone: ModelProtocol {
    public let closedAt: Date?
    public let closedIssues: Int
    public let createdAt: Date
    public let creator: User?
    public let description: String?
    public let dueOn: Date?
    public let htmlUrl: String
    public let id: Int
    public let labelsUrl: String
    public let nodeId: String
    /// The number of the milestone.
    public let number: Int
    public let openIssues: Int
    /// The state of the milestone.
    public let state: State
    /// The title of the milestone.
    public let title: String
    public let updatedAt: Date
    public let url: String

    public static var random: Self {
      Self(
        closedAt: .random,
        closedIssues: .random,
        createdAt: .random,
        creator: .random,
        description: .random,
        dueOn: .random,
        htmlUrl: .random,
        id: .random,
        labelsUrl: .random,
        nodeId: .random,
        number: .random,
        openIssues: .random,
        state: .random,
        title: .random,
        updatedAt: .random,
        url: .random
      )
    }
  }
}

public extension Octokit.Milestone {
  enum State: String, ModelProtocol {
    case closed
    case open

    public static var random: Self { Bool.random() ? .closed : .open }
    public var id: RawValue { rawValue }
  }
}
