import Casimir
import Foundation

extension Octokit {
  /// Issues are a great way to keep track of tasks, enhancements, and bugs for your projects.
  public struct Issue: ModelProtocol {
    public let activeLockReason: String?
    public let assignee: UserBrief?
    public let assignees: [UserBrief]?
    /// How the author is associated with the repository.
    public let authorAssociation: AuthorRepositoryAssociation?
    /// Contents of the issue
    public let body: String?
    public let bodyHtml: String?
    public let bodyText: String?
    public let closedAt: Date?
    public let closedBy: UserBrief?
    public let comments: Int
    public let commentsUrl: String?
    public let createdAt: Date?
    public let draft: Bool?
    public let eventsUrl: String?
    public let htmlUrl: String?
    public let id: Int
    /// Labels to associate with this issue; pass one or more label names to replace the set of
    /// labels on this issue; send an empty array to clear all labels from the issue; note that
    /// the labels are silently dropped for users without push access to the repository
    public let labels: [LabelElement]
    public let labelsUrl: String?
    public let locked: Bool
    public let milestone: Milestone?
    public let nodeId: String?
    /// Number uniquely identifying the issue within its repository
    public let number: Int
    public let performedViaGithubApp: GithubApp?
    public let pullRequest: PullRequest?
    public let reactions: Reactions?
    /// A repository on GitHub.
    public let repository: Repository?
    public let repositoryUrl: String
    /// State of the issue; either 'open' or 'closed'
    public let state: String
    /// The reason for the current state
    public let stateReason: StateReason?
    public let timelineUrl: String?
    /// Title of the issue
    public let title: String
    public let updatedAt: Date
    /// URL for the issue
    public let url: String
    public let user: UserBrief?

    internal enum CodingKeys: String, CodingKey {
      case activeLockReason = "active_lock_reason"
      case assignee = "assignee"
      case assignees = "assignees"
      case authorAssociation = "author_association"
      case body = "body"
      case bodyHtml = "body_html"
      case bodyText = "body_text"
      case closedAt = "closed_at"
      case closedBy = "closed_by"
      case comments = "comments"
      case commentsUrl = "comments_url"
      case createdAt = "created_at"
      case draft = "draft"
      case eventsUrl = "events_url"
      case htmlUrl = "html_url"
      case id = "id"
      case labels = "labels"
      case labelsUrl = "labels_url"
      case locked = "locked"
      case milestone = "milestone"
      case nodeId = "node_id"
      case number = "number"
      case performedViaGithubApp = "performed_via_github_app"
      case pullRequest = "pull_request"
      case reactions = "reactions"
      case repository = "repository"
      case repositoryUrl = "repository_url"
      case state = "state"
      case stateReason = "state_reason"
      case timelineUrl = "timeline_url"
      case title = "title"
      case updatedAt = "updated_at"
      case url = "url"
      case user = "user"
    }

    public static var random: Self {
      Self(
        activeLockReason: .random,
        assignee: .random,
        assignees: .random,
        authorAssociation: .random,
        body: .random,
        bodyHtml: .random,
        bodyText: .random,
        closedAt: .random,
        closedBy: .random,
        comments: .random,
        commentsUrl: .random,
        createdAt: .random,
        draft: .random,
        eventsUrl: .random,
        htmlUrl: .random,
        id: .random,
        labels: .random,
        labelsUrl: .random,
        locked: .random,
        milestone: .random,
        nodeId: .random,
        number: .random,
        performedViaGithubApp: .random,
        pullRequest: .random,
        reactions: .random,
        repository: .random,
        repositoryUrl: .random,
        state: .random,
        stateReason: .random,
        timelineUrl: .random,
        title: .random,
        updatedAt: .random,
        url: .random,
        user: .random
      )
    }
  }
}

public enum LabelElement: ModelProtocol {
  case labelClass(LabelClass)
  case string(String)

  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if let x = try? container.decode(String.self) {
      self = .string(x)
      return
    }
    if let x = try? container.decode(LabelClass.self) {
      self = .labelClass(x)
      return
    }
    throw DecodingError.typeMismatch(LabelElement.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for LabelElement"))
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .labelClass(let x):
      try container.encode(x)
    case .string(let x):
      try container.encode(x)
    }
  }

  public var id: UUID { UUID() }
  public static var random: Self {
    [.labelClass(.random), .string(.random)].random
  }
}

// MARK: - LabelClass
public struct LabelClass: ModelProtocol {
  public let color: String?
  public let labelDefault: Bool?
  public let description: String?
  public let id: Int?
  public let name: String?
  public let nodeId: String?
  public let url: String?

  internal enum CodingKeys: String, CodingKey {
    case color = "color"
    case labelDefault = "default"
    case description = "description"
    case id = "id"
    case name = "name"
    case nodeId = "node_id"
    case url = "url"
  }

  public static var random: Self {
    Self(
      color: .random,
      labelDefault: .random,
      description: .random,
      id: .random,
      name: .random,
      nodeId: .random,
      url: .random
    )
  }
}

extension Octokit.Issue {
  public struct Owner: Codable {
    public let avatarUrl: String?
    public let eventsUrl: String?
    public let followersUrl: String?
    public let followingUrl: String?
    public let gistsUrl: String?
    public let gravatarId: String?
    public let htmlUrl: String?
    public let id: Int?
    public let login: String?
    public let nodeId: String?
    public let organizationsUrl: String?
    public let receivedEventsUrl: String?
    public let reposUrl: String?
    public let siteAdmin: Bool?
    public let starredUrl: String?
    public let subscriptionsUrl: String?
    public let type: String?
    public let url: String?

    enum CodingKeys: String, CodingKey {
      case avatarUrl = "avatar_url"
      case eventsUrl = "events_url"
      case followersUrl = "followers_url"
      case followingUrl = "following_url"
      case gistsUrl = "gists_url"
      case gravatarId = "gravatar_id"
      case htmlUrl = "html_url"
      case id = "id"
      case login = "login"
      case nodeId = "node_id"
      case organizationsUrl = "organizations_url"
      case receivedEventsUrl = "received_events_url"
      case reposUrl = "repos_url"
      case siteAdmin = "site_admin"
      case starredUrl = "starred_url"
      case subscriptionsUrl = "subscriptions_url"
      case type = "type"
      case url = "url"
    }

    public static var random: Self {
      Self(
        avatarUrl: .random,
        eventsUrl: .random,
        followersUrl: .random,
        followingUrl: .random,
        gistsUrl: .random,
        gravatarId: .random,
        htmlUrl: .random,
        id: .random,
        login: .random,
        nodeId: .random,
        organizationsUrl: .random,
        receivedEventsUrl: .random,
        reposUrl: .random,
        siteAdmin: .random,
        starredUrl: .random,
        subscriptionsUrl: .random,
        type: .random,
        url: .random
      )
    }
  }
}

// extension Octokit.Label {
//  public struct UserBrief: ModelProtocol {
//    public let avatarUrl: String?
//    public let email: String?
//    //    public let eventsUrl: String
//    public let eventsUrl: String?
//    //    public let followersUrl: String
//    public let followersUrl: String?
//
//    public let followingUrl: String?
//    public let gistsUrl: String?
//    public let gravatarId: String?
//    public let htmlUrl: String?
//    public let id: Int
//    public let login: String
//    public let name: String?
//    public let nodeId: String?
//    public let organizationsUrl: String?
//    public let receivedEventsUrl: String?
//    public let reposUrl: String?
//    public let siteAdmin: Bool?
//    public let starredAt: String?
//    public let starredUrl: String?
//    public let subscriptionsUrl: String?
//    public let type: String
//    public let url: String
//
//    public static var random: Self {
//      Self(
//        avatarUrl: .random,
//        email: .random,
//        eventsUrl: .random,
//        followersUrl: .random,
//        followingUrl: .random,
//        gistsUrl: .random,
//        gravatarId: .random,
//        htmlUrl: .random,
//        id: .random,
//        login: .random,
//        name: .random,
//        nodeId: .random,
//        organizationsUrl: .random,
//        receivedEventsUrl: .random,
//        reposUrl: .random,
//        siteAdmin: .random,
//        starredAt: .random,
//        starredUrl: .random,
//        subscriptionsUrl: .random,
//        type: .random,
//        url: .random
//      )
//    }
//  }
// }
//
// extension Octokit.Label.UserBrief {
//  internal enum CodingKeys: String, CodingKey {
//    case avatarUrl = "avatar_url"
//    case email = "email"
//    case eventsUrl = "events_url"
//    case followersUrl = "followers_url"
//    case followingUrl = "following_url"
//    case gistsUrl = "gists_url"
//    case gravatarId = "gravatar_id"
//    case htmlUrl = "html_url"
//    case id = "id"
//    case login = "login"
//    case name = "name"
//    case nodeId = "node_id"
//    case organizationsUrl = "organizations_url"
//    case receivedEventsUrl = "received_events_url"
//    case reposUrl = "repos_url"
//    case siteAdmin = "site_admin"
//    case starredAt = "starred_at"
//    case starredUrl = "starred_url"
//    case subscriptionsUrl = "subscriptions_url"
//    case type = "type"
//    case url = "url"
//  }
// }
