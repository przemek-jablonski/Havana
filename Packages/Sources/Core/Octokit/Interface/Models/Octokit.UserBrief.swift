import Casimir
import Foundation

extension Octokit {
  /// Brief information set on given GitHub user.
  public struct UserBrief: ModelProtocol {
    internal init(avatarUrl: String, email: String? = nil, eventsUrl: String? = nil, followersUrl: String? = nil, followingUrl: String, gistsUrl: String, gravatarId: String? = nil, htmlUrl: String, id: Int, login: String, name: String? = nil, nodeId: String? = nil, organizationsUrl: String, receivedEventsUrl: String, reposUrl: String, siteAdmin: Bool, starredAt: String? = nil, starredUrl: String, subscriptionsUrl: String, type: String, url: String) {
      self.avatarUrl = avatarUrl
      self.email = email
      self.eventsUrl = eventsUrl
      self.followersUrl = followersUrl
      self.followingUrl = followingUrl
      self.gistsUrl = gistsUrl
      self.gravatarId = gravatarId
      self.htmlUrl = htmlUrl
      self.id = id
      self.login = login
      self.name = name
      self.nodeId = nodeId
      self.organizationsUrl = organizationsUrl
      self.receivedEventsUrl = receivedEventsUrl
      self.reposUrl = reposUrl
      self.siteAdmin = siteAdmin
      self.starredAt = starredAt
      self.starredUrl = starredUrl
      self.subscriptionsUrl = subscriptionsUrl
      self.type = type
      self.url = url
    }

    public let avatarUrl: String
    public let email: String?
//    public let eventsUrl: String
    public let eventsUrl: String?
//    public let followersUrl: String
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


    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<Octokit.UserBrief.CodingKeys> = try decoder.container(keyedBy: Octokit.UserBrief.CodingKeys.self)
      self.avatarUrl = try container.decode(String.self, forKey: Octokit.UserBrief.CodingKeys.avatarUrl)
      self.email = try container.decodeIfPresent(String.self, forKey: Octokit.UserBrief.CodingKeys.email)
      self.eventsUrl = try container.decodeIfPresent(String.self, forKey: Octokit.UserBrief.CodingKeys.eventsUrl)
      self.followersUrl = try container.decodeIfPresent(String.self, forKey: Octokit.UserBrief.CodingKeys.followersUrl)
      self.followingUrl = try container.decode(String.self, forKey: Octokit.UserBrief.CodingKeys.followingUrl)
      self.gistsUrl = try container.decode(String.self, forKey: Octokit.UserBrief.CodingKeys.gistsUrl)
      self.gravatarId = try container.decodeIfPresent(String.self, forKey: Octokit.UserBrief.CodingKeys.gravatarId)
      self.htmlUrl = try container.decode(String.self, forKey: Octokit.UserBrief.CodingKeys.htmlUrl)
      self.id = try container.decode(Int.self, forKey: Octokit.UserBrief.CodingKeys.id)
      self.login = try container.decode(String.self, forKey: Octokit.UserBrief.CodingKeys.login)
      self.name = try container.decodeIfPresent(String.self, forKey: Octokit.UserBrief.CodingKeys.name)
      self.nodeId = try container.decodeIfPresent(String.self, forKey: Octokit.UserBrief.CodingKeys.nodeId)
      self.organizationsUrl = try container.decode(String.self, forKey: Octokit.UserBrief.CodingKeys.organizationsUrl)
      self.receivedEventsUrl = try container.decode(String.self, forKey: Octokit.UserBrief.CodingKeys.receivedEventsUrl)
      self.reposUrl = try container.decode(String.self, forKey: Octokit.UserBrief.CodingKeys.reposUrl)
      self.siteAdmin = try container.decode(Bool.self, forKey: Octokit.UserBrief.CodingKeys.siteAdmin)
      self.starredAt = try container.decodeIfPresent(String.self, forKey: Octokit.UserBrief.CodingKeys.starredAt)
      self.starredUrl = try container.decode(String.self, forKey: Octokit.UserBrief.CodingKeys.starredUrl)
      self.subscriptionsUrl = try container.decode(String.self, forKey: Octokit.UserBrief.CodingKeys.subscriptionsUrl)
      self.type = try container.decode(String.self, forKey: Octokit.UserBrief.CodingKeys.type)
      self.url = try container.decode(String.self, forKey: Octokit.UserBrief.CodingKeys.url)
    }

    public static var random: Self {
      Self(
        avatarUrl: .random,
        email: .random,
        eventsUrl: .random,
        followersUrl: .random,
        followingUrl: .random,
        gistsUrl: .random,
        gravatarId: .random,
        htmlUrl: .random,
        id: .random,
        login: .random,
        name: .random,
        nodeId: .random,
        organizationsUrl: .random,
        receivedEventsUrl: .random,
        reposUrl: .random,
        siteAdmin: .random,
        starredAt: .random,
        starredUrl: .random,
        subscriptionsUrl: .random,
        type: .random,
        url: .random
      )
    }
  }
}
