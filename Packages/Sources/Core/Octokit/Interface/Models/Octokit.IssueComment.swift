import Casimir
import Foundation

public extension Octokit {
  /// Comments provide a way for people to collaborate on an issue.
  struct IssueComment: ModelProtocol {
    /// How the author is associated with the repository.
    public let authorAssociation: AuthorRepositoryAssociation
    /// Contents of the issue comment
    public let body: String?
    public let bodyHtml: String?
    public let bodyText: String?
    public let createdAt: Date
    public let htmlUrl: String
    /// Unique identifier of the issue comment
    public let id: Int
    public let issueUrl: String?
    public let nodeId: String?
    public let performedViaGithubApp: GithubApp?
    public let reactions: Reactions?
    public let updatedAt: Date
    /// URL for the issue comment
    public let url: String
    public let user: UserBrief?

    internal enum CodingKeys: String, CodingKey {
      case authorAssociation = "author_association"
      case body = "body"
      case bodyHtml = "body_html"
      case bodyText = "body_text"
      case createdAt = "created_at"
      case htmlUrl = "html_url"
      case id = "id"
      case issueUrl = "issue_url"
      case nodeId = "node_id"
      case performedViaGithubApp = "performed_via_github_app"
      case reactions = "reactions"
      case updatedAt = "updated_at"
      case url = "url"
      case user = "user"
    }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        authorAssociation: .random(),
        body: .random(),
        bodyHtml: .random(),
        bodyText: .random(),
        createdAt: .random(),
        htmlUrl: .random(),
        id: .random(),
        issueUrl: .random(),
        nodeId: .random(),
        performedViaGithubApp: .random(),
        reactions: .random(),
        updatedAt: .random(),
        url: .random(),
        user: .random()
      )
    }
  }
}
