import Casimir
import Foundation

public extension Octokit {
  struct GithubApp: ModelProtocol {
    public let clientId: String?
    public let clientSecret: String?
    public let createdAt: Date
    public let description: String?
    public let events: [String]
    public let externalUrl: String
    public let htmlUrl: String
    public let id: Int
    public let installationsCount: Int?
    public let name: String
    public let nodeId: String?
    public let owner: UserBrief?
    public let pem: String?
    public let permissions: [String: String]
    public let slug: String?
    public let updatedAt: Date
    public let webhookSecret: String?

    internal enum CodingKeys: String, CodingKey {
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
