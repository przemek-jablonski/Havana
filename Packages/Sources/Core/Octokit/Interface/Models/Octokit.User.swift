import Casimir
import Foundation

public extension Octokit {
  // MARK: - User
  struct User: ModelProtocol {
    public let avatarUrl: String
    public let bio: String?
    public let blog: String?
    public let businessPlus: Bool?
    public let collaborators: Int?
    public let company: String?
    public let createdAt: Date?
    public let diskUsage: Int?
    public let email: String?
    public let eventsUrl: String
    public let followers: Int
    public let followersUrl: String
    public let following: Int
    public let followingUrl: String
    public let gistsUrl: String
    public let gravatarId: String?
    public let hireable: Bool?
    public let htmlUrl: String
    public let id: Int
    public let ldapDn: String?
    public let location: String?
    public let login: String
    public let name: String?
    public let nodeId: String?
    public let organizationsUrl: String
    public let ownedPrivateRepos: Int?
    public let plan: Plan?
    public let privateGists: Int?
    public let publicGists: Int
    public let publicRepos: Int
    public let receivedEventsUrl: String
    public let reposUrl: String
    public let siteAdmin: Bool
    public let starredUrl: String
    public let subscriptionsUrl: String
    public let suspendedAt: Date?
    public let totalPrivateRepos: Int?
    public let twitterUsername: String?
    public let twoFactorAuthentication: Bool?
    public let type: String
    public let updatedAt: Date
    public let url: String

    enum CodingKeys: String, CodingKey {
      case avatarUrl = "avatar_url"
      case bio = "bio"
      case blog = "blog"
      case businessPlus = "business_plus"
      case collaborators = "collaborators"
      case company = "company"
      case createdAt = "created_at"
      case diskUsage = "disk_usage"
      case email = "email"
      case eventsUrl = "events_url"
      case followers = "followers"
      case followersUrl = "followers_url"
      case following = "following"
      case followingUrl = "following_url"
      case gistsUrl = "gists_url"
      case gravatarId = "gravatar_d"
      case hireable = "hireable"
      case htmlUrl = "html_url"
      case id = "id"
      case ldapDn = "ldap_dn"
      case location = "location"
      case login = "login"
      case name = "name"
      case nodeId = "node_id"
      case organizationsUrl = "organizations_url"
      case ownedPrivateRepos = "owned_private_repos"
      case plan = "plan"
      case privateGists = "private_gists"
      case publicGists = "public_gists"
      case publicRepos = "public_repos"
      case receivedEventsUrl = "received_events_url"
      case reposUrl = "repos_url"
      case siteAdmin = "site_admin"
      case starredUrl = "starred_url"
      case subscriptionsUrl = "subscriptions_url"
      case suspendedAt = "suspended_at"
      case totalPrivateRepos = "total_private_repos"
      case twitterUsername = "twitter_username"
      case twoFactorAuthentication = "two_factor_authentication"
      case type = "type"
      case updatedAt = "updated_at"
      case url = "url"
    }

    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      User(
        avatarUrl: .random(),
        bio: .random(),
        blog: .random(),
        businessPlus: .random(),
        collaborators: .random(),
        company: .random(),
        createdAt: .random(),
        diskUsage: .random(),
        email: .random(),
        eventsUrl: .random(),
        followers: .random(),
        followersUrl: .random(),
        following: .random(),
        followingUrl: .random(),
        gistsUrl: .random(),
        gravatarId: .random(),
        hireable: .random(),
        htmlUrl: .random(),
        id: .random(),
        ldapDn: .random(),
        location: .random(),
        login: .random(),
        name: .random(),
        nodeId: .random(),
        organizationsUrl: .random(),
        ownedPrivateRepos: .random(),
        plan: .random(),
        privateGists: .random(),
        publicGists: .random(),
        publicRepos: .random(),
        receivedEventsUrl: .random(),
        reposUrl: .random(),
        siteAdmin: .random(),
        starredUrl: .random(),
        subscriptionsUrl: .random(),
        suspendedAt: .random(),
        totalPrivateRepos: .random(),
        twitterUsername: .random(),
        twoFactorAuthentication: .random(),
        type: .random(),
        updatedAt: .random(),
        url: .random()
      )
    }
  }

  // MARK: - Plan
  struct Plan: ModelProtocol {
    public var id: String { name }
    public let collaborators: Int
    public let name: String
    public let privateRepos: Int
    public let space: Int

    enum CodingKeys: String, CodingKey {
      case collaborators = "collaborators"
      case name = "name"
      case privateRepos = "private_repos"
      case space = "space"
    }

    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        collaborators: .random(),
        name: .random(),
        privateRepos: .random(),
        space: .random()
      )
    }
  }
}
