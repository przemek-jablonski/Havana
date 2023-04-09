import Casimir
import Foundation

public extension Octokit {
  /// Issues are a great way to keep track of tasks, enhancements, and bugs for your projects.
  struct Issue: ModelProtocol {
    public let activeLockReason: String?
    public let assignee: User?
    public let assignees: [User]?
    /// How the author is associated with the repository.
    public let authorAssociation: AuthorRepositoryAssociation
    /// Contents of the issue
    public let body: String?
    public let bodyHtml: String?
    public let bodyText: String?
    public let closedAt: Date?
    public let closedBy: User?
    public let comments: Int
    public let commentsUrl: String
    public let createdAt: Date
    public let draft: Bool?
    public let eventsUrl: String
    public let htmlUrl: String
    public let id: Int
    /// Labels to associate with this issue; pass one or more label names to replace the set of
    /// labels on this issue; send an empty array to clear all labels from the issue; note that
    /// the labels are silently dropped for users without push access to the repository
    public let labels: [Label]
    public let labelsUrl: String
    public let locked: Bool
    public let milestone: Milestone?
    public let nodeId: String
    /// Number uniquely identifying the issue within its repository
    public let number: Int
    public let performedViaGithubApp: IssueGitHubApp?
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
    public let user: User?

    public static var random: Issue {
      Issue(
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
