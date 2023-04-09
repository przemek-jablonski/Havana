import Casimir
import Foundation

public extension Octokit {
  // MARK: - Payload
  struct Payload: ModelProtocol {
    public let id: String?

    public let action: String?
    /// Comments provide a way for people to collaborate on an issue.
    public let comment: IssueComment?
    /// Issues are a great way to keep track of tasks, enhancements, and bugs for your projects.
    public let issue: Issue?
    public let pages: [Page]?

    public static var random: Self {
      Self(
        id: .random,
        action: .random,
        comment: .random,
        issue: .random,
        pages: .random
      )
    }
  }
}
