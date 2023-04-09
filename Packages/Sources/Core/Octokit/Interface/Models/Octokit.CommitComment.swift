import Casimir
import Foundation

public extension Octokit {
  /// Commit Comment
  // MARK: - CommitCommentElement
  struct CommitComment: ModelProtocol {
    /// How the author is associated with the repository.
    public let authorAssociation: AuthorRepositoryAssociation?
    public let body: String
    public let commitId: String
    public let createdAt: Date
    public let htmlUrl: String
    public let id: Int
    public let line: Int?
    public let nodeId: String
    public let path: String?
    public let position: Int?
    public let reactions: Reactions?
    public let updatedAt: Date
    public let url: String
    public let user: User?

    enum CodingKeys: String, CodingKey {
      case authorAssociation = "author_association"
      case body = "body"
      case commitId = "commit_id"
      case createdAt = "created_at"
      case htmlUrl = "html_url"
      case id = "id"
      case line = "line"
      case nodeId = "node_id"
      case path = "path"
      case position = "position"
      case reactions = "reactions"
      case updatedAt = "updated_at"
      case url = "url"
      case user = "user"
    }

    public static var random: Self {
      Self.init(
        authorAssociation: .random,
        body: .random,
        commitId: .random,
        createdAt: .random,
        htmlUrl: .random,
        id: .random,
        line: .random,
        nodeId: .random,
        path: .random,
        position: .random,
        reactions: .random,
        updatedAt: .random,
        url: .random,
        user: .random
      )
    }
  }
}
