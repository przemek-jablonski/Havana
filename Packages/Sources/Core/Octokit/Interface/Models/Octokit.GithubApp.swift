import Casimir
import Foundation

extension Octokit {
  /// GitHub apps are a new way to extend GitHub. They can be installed directly on
  /// organizations and user accounts and granted access to specific repositories. They come
  /// with granular permissions and built-in webhooks. GitHub apps are first class actors
  /// within GitHub.
  public struct GithubApp: ModelProtocol {
    public let clientId: String?
    public let clientSecret: String?
    public let createdAt: Date
    public let description: String?
    /// The list of events for the GitHub app
    public let events: [String]
    public let externalUrl: String
    public let htmlUrl: String
    /// Unique identifier of the GitHub app
    public let id: Int
    /// The number of installations associated with the GitHub app
    public let installationsCount: Int?
    /// The name of the GitHub app
    public let name: String
    public let nodeId: String?
    public let owner: UserBrief?
    public let pem: String?
    /// The set of permissions for the GitHub app
    public let permissions: [String: String]
    /// The slug name of the GitHub app
    public let slug: String?
    public let updatedAt: Date
    public let webhookSecret: String?

    enum CodingKeys: String, CodingKey {
      case clientId = "client_id"
      case clientSecret = "client_secret"
      case createdAt = "created_at"
      case description = "description"
      case events = "events"
      case externalUrl = "external_url"
      case htmlUrl = "html_url"
      case id = "id"
      case installationsCount = "installations_count"
      case name = "name"
      case nodeId = "node_id"
      case owner = "owner"
      case pem = "pem"
      case permissions = "permissions"
      case slug = "slug"
      case updatedAt = "updated_at"
      case webhookSecret = "webhook_secret"
    }

    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        clientId: .random(),
        clientSecret: .random(),
        createdAt: .random(),
        description: .random(),
        events: .random(),
        externalUrl: .random(),
        htmlUrl: .random(),
        id: .random(),
        installationsCount: .random(),
        name: .random(),
        nodeId: .random(),
        owner: .random(),
        pem: .random(),
        permissions: .random(),
        slug: .random(),
        updatedAt: .random(),
        webhookSecret: .random()
      )
    }
  }
}
