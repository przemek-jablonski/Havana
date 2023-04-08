import Casimir
import Foundation

public extension Octokit {
  // MARK: - Hyperlinks
  struct Hyperlinks: ModelProtocol {
    public var id: Int = .invalid
    public let authorizationsUrl: String?
    public let codeSearchUrl: String?
    public let commitSearchUrl: String?
    public let currentUserAuthorizationsHtmlUrl: String?
    public let currentUserRepositoriesUrl: String?
    public let currentUserUrl: String?
    public let emailsUrl: String?
    public let emojisUrl: String?
    public let eventsUrl: String?
    public let feedsUrl: String?
    public let followersUrl: String?
    public let followingUrl: String?
    public let gistsUrl: String?
    public let hubUrl: String?
    public let issueSearchUrl: String?
    public let issuesUrl: String?
    public let keysUrl: String?
    public let labelSearchUrl: String?
    public let notificationsUrl: String?
    public let organizationRepositoriesUrl: String?
    public let organizationTeamsUrl: String?
    public let organizationUrl: String?
    public let publicGistsUrl: String?
    public let rateLimitUrl: String?
    public let repositorySearchUrl: String?
    public let repositoryUrl: String?
    public let starredGistsUrl: String?
    public let starredUrl: String?
    public let topicSearchUrl: String??
    public let userOrganizationsUrl: String?
    public let userRepositoriesUrl: String?
    public let userSearchUrl: String?
    public let userUrl: String?

    enum CodingKeys: String, CodingKey {
      case authorizationsUrl = "authorizations_url"
      case codeSearchUrl = "code_search_url"
      case commitSearchUrl = "commit_search_url"
      case currentUserAuthorizationsHtmlUrl = "current_user_authorizations_html_url"
      case currentUserRepositoriesUrl = "current_user_repositories_url"
      case currentUserUrl = "current_user_url"
      case emailsUrl = "emails_url"
      case emojisUrl = "emojis_url"
      case eventsUrl = "events_url"
      case feedsUrl = "feeds_url"
      case followersUrl = "followers_url"
      case followingUrl = "following_url"
      case gistsUrl = "gists_url"
      case hubUrl = "hub_url"
      case issueSearchUrl = "issue_search_url"
      case issuesUrl = "issues_url"
      case keysUrl = "keys_url"
      case labelSearchUrl = "label_search_url"
      case notificationsUrl = "notifications_url"
      case organizationRepositoriesUrl = "organization_repositories_url"
      case organizationTeamsUrl = "organization_teams_url"
      case organizationUrl = "organization_url"
      case publicGistsUrl = "public_gists_url"
      case rateLimitUrl = "rate_limit_url"
      case repositorySearchUrl = "repository_search_url"
      case repositoryUrl = "repository_url"
      case starredGistsUrl = "starred_gists_url"
      case starredUrl = "starred_url"
      case topicSearchUrl = "topic_search_url"
      case userOrganizationsUrl = "user_organizations_url"
      case userRepositoriesUrl = "user_repositories_url"
      case userSearchUrl = "user_search_url"
      case userUrl = "user_url"
    }

    public static var random: Octokit.Hyperlinks {
      Octokit.Hyperlinks(
        authorizationsUrl: .random,
        codeSearchUrl: .random,
        commitSearchUrl: .random,
        currentUserAuthorizationsHtmlUrl: .random,
        currentUserRepositoriesUrl: .random,
        currentUserUrl: .random,
        emailsUrl: .random,
        emojisUrl: .random,
        eventsUrl: .random,
        feedsUrl: .random,
        followersUrl: .random,
        followingUrl: .random,
        gistsUrl: .random,
        hubUrl: .random,
        issueSearchUrl: .random,
        issuesUrl: .random,
        keysUrl: .random,
        labelSearchUrl: .random,
        notificationsUrl: .random,
        organizationRepositoriesUrl: .random,
        organizationTeamsUrl: .random,
        organizationUrl: .random,
        publicGistsUrl: .random,
        rateLimitUrl: .random,
        repositorySearchUrl: .random,
        repositoryUrl: .random,
        starredGistsUrl: .random,
        starredUrl: .random,
        topicSearchUrl: .random,
        userOrganizationsUrl: .random,
        userRepositoriesUrl: .random,
        userSearchUrl: .random,
        userUrl: .random
      )
    }
  }
}
