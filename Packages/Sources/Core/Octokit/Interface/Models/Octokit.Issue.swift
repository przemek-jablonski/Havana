import Casimir
import Foundation

// swiftlint:disable discouraged_optional_boolean
// swiftlint:disable discouraged_optional_collection
// swiftlint:disable identifier_name

public extension Octokit {
  struct Issue: ModelProtocol {
    public let activeLockReason: String?
    public let assignee: UserBrief?
    public let assignees: [UserBrief]?
    public let authorAssociation: AuthorRepositoryAssociation?
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
    public let labels: [Label]
    public let labelsUrl: String?
    public let locked: Bool
    public let milestone: Milestone?
    public let nodeId: String?
    public let number: Int
    public let performedViaGithubApp: GithubApp?
    public let pullRequest: PullRequest?
    public let reactions: Reactions?
    public let repository: Repository?
    public let repositoryUrl: String
    public let state: String
    public let stateReason: StateReason?
    public let timelineUrl: String?
    public let title: String
    public let updatedAt: Date
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

    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        activeLockReason: .random(),
        assignee: .random(),
        assignees: .random(),
        authorAssociation: .random(),
        body: .random(),
        bodyHtml: .random(),
        bodyText: .random(),
        closedAt: .random(),
        closedBy: .random(),
        comments: .random(),
        commentsUrl: .random(),
        createdAt: .random(),
        draft: .random(),
        eventsUrl: .random(),
        htmlUrl: .random(),
        id: .random(),
        labels: .random(),
        labelsUrl: .random(),
        locked: .random(),
        milestone: .random(),
        nodeId: .random(),
        number: .random(),
        performedViaGithubApp: .random(),
        pullRequest: .random(),
        reactions: .random(),
        repository: .random(),
        repositoryUrl: .random(),
        state: .random(),
        stateReason: .random(),
        timelineUrl: .random(),
        title: .random(),
        updatedAt: .random(),
        url: .random(),
        user: .random()
      )
    }
  }
}
// swiftlint:enable discouraged_optional_boolean
// swiftlint:enable identifier_name
// swiftlint:disable discouraged_optional_collection
