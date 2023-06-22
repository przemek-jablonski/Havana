import Casimir
import Foundation

public extension Octokit {
  struct UserBrief: ModelProtocol {
    public let avatarUrl: String
    public let email: String?
    public let eventsUrl: String?
    public let followersUrl: String?
    public let followingUrl: String
    public let gistsUrl: String
    public let gravatarId: String?
    public let htmlUrl: String
    public let id: Int
    public let login: String
    public let name: String?
    public let nodeId: String?
    public let organizationsUrl: String
    public let receivedEventsUrl: String
    public let reposUrl: String
    public let siteAdmin: Bool
    public let starredAt: String?
    public let starredUrl: String
    public let subscriptionsUrl: String
    public let type: String
    public let url: String

    internal enum CodingKeys: String, CodingKey {
      case avatarUrl = "avatar_url"
      case email = "email"
      case eventsUrl = "events_url"
      case followersUrl = "followers_url"
      case followingUrl = "following_url"
      case gistsUrl = "gists_url"
      case gravatarId = "gravatar_id"
      case htmlUrl = "html_url"
      case id = "id"
      case login = "login"
      case name = "name"
      case nodeId = "node_id"
      case organizationsUrl = "organizations_url"
      case receivedEventsUrl = "received_events_url"
      case reposUrl = "repos_url"
      case siteAdmin = "site_admin"
      case starredAt = "starred_at"
      case starredUrl = "starred_url"
      case subscriptionsUrl = "subscriptions_url"
      case type = "type"
      case url = "url"
    }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        avatarUrl: .random(),
        email: .random(),
        eventsUrl: .random(),
        followersUrl: .random(),
        followingUrl: .random(),
        gistsUrl: .random(),
        gravatarId: .random(),
        htmlUrl: .random(),
        id: .random(),
        login: .random(),
        name: .random(),
        nodeId: .random(),
        organizationsUrl: .random(),
        receivedEventsUrl: .random(),
        reposUrl: .random(),
        siteAdmin: .random(),
        starredAt: .random(),
        starredUrl: .random(),
        subscriptionsUrl: .random(),
        type: .random(),
        url: .random()
      )
    }
  }
}
