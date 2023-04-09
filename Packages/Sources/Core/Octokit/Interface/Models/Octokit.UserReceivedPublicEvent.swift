import Casimir
import Foundation

// swiftlint:disable file_length

public extension Octokit {
  /// Event
  // MARK: - Event
  struct UserReceivedPublicEvent: ModelProtocol {
    public static var random: Self {
      Self(
        actor: .random,
        createdAt: .random,
        id: .random,
        org: .random,
        payload: .random,
        public: .random,
        repo: .random,
        type: .random
      )
    }

    /// Actor
    public let actor: Actor
    public let createdAt: Date?
    public let id: String
    /// Actor
    public let org: Actor?
    public let payload: Payload
    public let `public`: Bool
    public let repo: Repo
    public let type: EventType?
  }

  /// Actor
  // MARK: - Actor
  struct Actor: ModelProtocol {
    public static var random: Self {
      Self(
        avatarUrl: .random,
        displayLogin: .random,
        gravatarId: .random,
        id: .random,
        login: .random,
        url: .random
      )
    }
    public let avatarUrl: String
    public let displayLogin: String?
    public let gravatarId: String?
    public let id: Int
    public let login: String
    public let url: String
  }

  // MARK: - Payload
  struct Payload: ModelProtocol {
    public static var random: Self {Self(
      action: .random,
      comment: .random,
      issue: .random,
      pages: .random
    )
    }

    public var id: String { "\(action ?? "")\(issue?.id)" }

    public let action: String?
    /// Comments provide a way for people to collaborate on an issue.
    public let comment: IssueComment?
    /// Issues are a great way to keep track of tasks, enhancements, and bugs for your projects.
    public let issue: Issue?
    public let pages: [Page]?
  }

  /// GitHub apps are a new way to extend GitHub. They can be installed directly on
  /// organizations and user accounts and granted access to specific repositories. They come
  /// with granular permissions and built-in webhooks. GitHub apps are first class actors
  /// within GitHub.
  // MARK: - CommentGitHubApp
  struct CommentGitHubApp: ModelProtocol {
    public static var random: Self {Self(
      clientId: .random,
      clientSecret: .random,
      createdAt: .random,
      description: .random,
      events: .random,
      externalUrl: .random,
      htmlUrl: .random,
      id: .random,
      installationsCount: .random,
      name: .random,
      nodeId: .random,
      owner: .random,
      pem: .random,
      permissions: .random,
      slug: .random,
      updatedAt: .random,
      webhookSecret: .random
    )
    }

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
    public let nodeId: String
    public let owner: User?
    public let pem: String?
    /// The set of permissions for the GitHub app
    public let permissions: [String: String]
    /// The slug name of the GitHub app
    public let slug: String?
    public let updatedAt: Date
    public let webhookSecret: String?
  }

  /// GitHub apps are a new way to extend GitHub. They can be installed directly on
  /// organizations and user accounts and granted access to specific repositories. They come
  /// with granular permissions and built-in webhooks. GitHub apps are first class actors
  /// within GitHub.
  // MARK: - IssueGitHubApp
  struct IssueGitHubApp: ModelProtocol {
    public static var random: Self {Self(
      clientId: .random,
      clientSecret: .random,
      createdAt: .random,
      description: .random,
      events: .random,
      externalUrl: .random,
      htmlUrl: .random,
      id: .random,
      installationsCount: .random,
      name: .random,
      nodeId: .random,
      owner: .random,
      pem: .random,
      permissions: .random,
      slug: .random,
      updatedAt: .random,
      webhookSecret: .random
    )
    }
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
    public let nodeId: String
    public let owner: User?
    public let pem: String?
    /// The set of permissions for the GitHub app
    public let permissions: [String: String]
    /// The slug name of the GitHub app
    public let slug: String?
    public let updatedAt: Date
    public let webhookSecret: String?
  }

  // MARK: - PullRequest
  struct PullRequest: ModelProtocol {
    public static var random: Self {Self(
      diffUrl: .random,
      htmlUrl: .random,
      mergedAt: .random,
      patchUrl: .random,
      url: .random
    )
    }
    public var id: String? { url }
    public let diffUrl: String?
    public let htmlUrl: String?
    public let mergedAt: Date?
    public let patchUrl: String?
    public let url: String?
  }

  /// License Simple
  // MARK: - LicenseSimple
  struct LicenseSimple: ModelProtocol {
    public static var random: Self {Self(
      htmlUrl: .random,
      key: .random,
      name: .random,
      nodeId: .random,
      spdxId: .random,
      url: .random
    )
    }

    public var id: String { name }

    public let htmlUrl: String?
    public let key: String
    public let name: String
    public let nodeId: String
    public let spdxId: String?
    public let url: String?
  }

  /// The default value for a merge commit message.
  ///
  /// - `PR_TITLE` - default to the pull request's title.
  /// - `PR_BODY` - default to the pull request's body.
  /// - `BLANK` - default to a blank commit message.
  enum MergeCommitMessage: String, CaseIterable, ModelProtocol {
    public static var random: Self {
      Self.allCases.random
    }

    public var id: RawValue { rawValue }

    case blank
    case prBody
    case prTitle
  }

  /// The default value for a merge commit title.
  ///
  /// - `PR_TITLE` - default to the pull request's title.
  /// - `MERGE_MESSAGE` - default to the classic title for a merge message (e.g., Merge pull
  /// request #123 from branch-name).
  enum MergeCommitTitle: String, CaseIterable, ModelProtocol {
    public static var random: Self {
      Self.allCases.random
    }

    public var id: RawValue { rawValue }

    case mergeMessage
    case prTitle
  }

  // MARK: - RepositoryPermissions
  struct RepositoryPermissions: ModelProtocol {
    public static var random: Self {Self(
      admin: .random,
      maintain: .random,
      pull: .random,
      push: .random,
      triage: .random
    )
    }

    public var id: Int { -1 }

    public let admin: Bool
    public let maintain: Bool?
    public let pull: Bool
    public let push: Bool
    public let triage: Bool?
  }

  /// The default value for a squash merge commit message:
  ///
  /// - `PR_BODY` - default to the pull request's body.
  /// - `COMMIT_MESSAGES` - default to the branch's commit messages.
  /// - `BLANK` - default to a blank commit message.
  enum SquashMergeCommitMessage: String, CaseIterable, ModelProtocol {
    public static var random: Self {
      Self.allCases.random
    }

    public var id: RawValue { rawValue }

    case blank
    case commitMessages
    case prBody
  }

  /// The default value for a squash merge commit title:
  ///
  /// - `PR_TITLE` - default to the pull request's title.
  /// - `COMMIT_OR_PR_TITLE` - default to the commit's title (if only one commit) or the pull
  /// request's title (when more than one commit).
  enum SquashMergeCommitTitle: String, CaseIterable, ModelProtocol {
    public static var random: Self {
      Self.allCases.random
    }

    public var id: RawValue { rawValue }
    case commitOrPrTitle
    case prTitle
  }

  // MARK: - TemplateRepository
  struct TemplateRepository: ModelProtocol {
    public static var random: Self {Self(
      allowAutoMerge: .random,
      allowMergeCommit: .random,
      allowRebaseMerge: .random,
      allowSquashMerge: .random,
      allowUpdateBranch: .random,
      archiveUrl: .random,
      archived: .random,
      assigneesUrl: .random,
      blobsUrl: .random,
      branchesUrl: .random,
      cloneUrl: .random,
      collaboratorsUrl: .random,
      commentsUrl: .random,
      commitsUrl: .random,
      compareUrl: .random,
      contentsUrl: .random,
      contributorsUrl: .random,
      createdAt: .random,
      defaultBranch: .random,
      deleteBranchOnMerge: .random,
      deploymentsUrl: .random,
      description: .random,
      disabled: .random,
      downloadsUrl: .random,
      eventsUrl: .random,
      fork: .random,
      forksCount: .random,
      forksUrl: .random,
      fullName: .random,
      gitCommitsUrl: .random,
      gitRefsUrl: .random,
      gitTagsUrl: .random,
      gitUrl: .random,
      hasDownloads: .random,
      hasIssues: .random,
      hasPages: .random,
      hasProjects: .random,
      hasWiki: .random,
      homepage: .random,
      hooksUrl: .random,
      htmlUrl: .random,
      id: .random,
      isTemplate: .random,
      issueCommentUrl: .random,
      issueEventsUrl: .random,
      issuesUrl: .random,
      keysUrl: .random,
      labelsUrl: .random,
      language: .random,
      languagesUrl: .random,
      mergeCommitMessage: .random,
      mergeCommitTitle: .random,
      mergesUrl: .random,
      milestonesUrl: .random,
      mirrorUrl: .random,
      name: .random,
      networkCount: .random,
      nodeId: .random,
      notificationsUrl: .random,
      openIssuesCount: .random,
      owner: .random,
      permissions: .random,
      templateRepositoryPrivate: .random,
      pullsUrl: .random,
      pushedAt: .random,
      releasesUrl: .random,
      size: .random,
      squashMergeCommitMessage: .random,
      squashMergeCommitTitle: .random,
      sshUrl: .random,
      stargazersCount: .random,
      stargazersUrl: .random,
      statusesUrl: .random,
      subscribersCount: .random,
      subscribersUrl: .random,
      subscriptionUrl: .random,
      svnUrl: .random,
      tagsUrl: .random,
      teamsUrl: .random,
      tempCloneToken: .random,
      topics: .random,
      treesUrl: .random,
      updatedAt: .random,
      url: .random,
      useSquashPrTitleAsDefault: .random,
      visibility: .random,
      watchersCount: .random
    )
    }
    public let allowAutoMerge: Bool?
    public let allowMergeCommit: Bool?
    public let allowRebaseMerge: Bool?
    public let allowSquashMerge: Bool?
    public let allowUpdateBranch: Bool?
    public let archiveUrl: String?
    public let archived: Bool?
    public let assigneesUrl: String?
    public let blobsUrl: String?
    public let branchesUrl: String?
    public let cloneUrl: String?
    public let collaboratorsUrl: String?
    public let commentsUrl: String?
    public let commitsUrl: String?
    public let compareUrl: String?
    public let contentsUrl: String?
    public let contributorsUrl: String?
    public let createdAt: String?
    public let defaultBranch: String?
    public let deleteBranchOnMerge: Bool?
    public let deploymentsUrl: String?
    public let description: String?
    public let disabled: Bool?
    public let downloadsUrl: String?
    public let eventsUrl: String?
    public let fork: Bool?
    public let forksCount: Int?
    public let forksUrl: String?
    public let fullName: String?
    public let gitCommitsUrl: String?
    public let gitRefsUrl: String?
    public let gitTagsUrl: String?
    public let gitUrl: String?
    public let hasDownloads: Bool?
    public let hasIssues: Bool?
    public let hasPages: Bool?
    public let hasProjects: Bool?
    public let hasWiki: Bool?
    public let homepage: String?
    public let hooksUrl: String?
    public let htmlUrl: String?
    public let id: Int?
    public let isTemplate: Bool?
    public let issueCommentUrl: String?
    public let issueEventsUrl: String?
    public let issuesUrl: String?
    public let keysUrl: String?
    public let labelsUrl: String?
    public let language: String?
    public let languagesUrl: String?
    /// The default value for a merge commit message.
    ///
    /// - `PR_TITLE` - default to the pull request's title.
    /// - `PR_BODY` - default to the pull request's body.
    /// - `BLANK` - default to a blank commit message.
    public let mergeCommitMessage: MergeCommitMessage?
    /// The default value for a merge commit title.
    ///
    /// - `PR_TITLE` - default to the pull request's title.
    /// - `MERGE_MESSAGE` - default to the classic title for a merge message (e.g., Merge pull
    /// request #123 from branch-name).
    public let mergeCommitTitle: MergeCommitTitle?
    public let mergesUrl: String?
    public let milestonesUrl: String?
    public let mirrorUrl: String?
    public let name: String?
    public let networkCount: Int?
    public let nodeId: String?
    public let notificationsUrl: String?
    public let openIssuesCount: Int?
    public let owner: User?
    public let permissions: TemplateRepositoryPermissions?
    public let templateRepositoryPrivate: Bool?
    public let pullsUrl: String?
    public let pushedAt: String?
    public let releasesUrl: String?
    public let size: Int?
    /// The default value for a squash merge commit message:
    ///
    /// - `PR_BODY` - default to the pull request's body.
    /// - `COMMIT_MESSAGES` - default to the branch's commit messages.
    /// - `BLANK` - default to a blank commit message.
    public let squashMergeCommitMessage: SquashMergeCommitMessage?
    /// The default value for a squash merge commit title:
    ///
    /// - `PR_TITLE` - default to the pull request's title.
    /// - `COMMIT_OR_PR_TITLE` - default to the commit's title (if only one commit) or the pull
    /// request's title (when more than one commit).
    public let squashMergeCommitTitle: SquashMergeCommitTitle?
    public let sshUrl: String?
    public let stargazersCount: Int?
    public let stargazersUrl: String?
    public let statusesUrl: String?
    public let subscribersCount: Int?
    public let subscribersUrl: String?
    public let subscriptionUrl: String?
    public let svnUrl: String?
    public let tagsUrl: String?
    public let teamsUrl: String?
    public let tempCloneToken: String?
    public let topics: [String]?
    public let treesUrl: String?
    public let updatedAt: String?
    public let url: String?
    public let useSquashPrTitleAsDefault: Bool?
    public let visibility: String?
    public let watchersCount: Int?
  }

  // MARK: - TemplateRepositoryPermissions
  struct TemplateRepositoryPermissions: ModelProtocol {
    public static var random: Self {Self(
      admin: .random,
      maintain: .random,
      pull: .random,
      push: .random,
      triage: .random
    )
    }

    public var id: Int?

    public let admin: Bool?
    public let maintain: Bool?
    public let pull: Bool?
    public let push: Bool?
    public let triage: Bool?
  }

  enum StateReason: String, CaseIterable, ModelProtocol {
    public static var random: StateReason {
      StateReason.allCases.randomElement() ?? .notPlanned
    }

    public static var allCases: [Octokit.StateReason] {
      [.completed, .notPlanned, .reopened]
    }

    public var id: Int { .invalid }

    case completed = "completed"
    case notPlanned = "not_planned"
    case reopened = "reopened"
    //    case unknown(String)
  }

  // MARK: - Page
  struct Page: ModelProtocol {
    public static var random: Page {
      Page(
        action: .random,
        htmlUrl: .random,
        pageName: .random,
        sha: .random,
        summary: .random,
        title: .random
      )
    }

    public var id: String? { sha }
    public let action: String?
    public let htmlUrl: String?
    public let pageName: String?
    public let sha: String?
    public let summary: String?
    public let title: String?
  }

  // MARK: - Repo
  struct Repo: ModelProtocol {
    public static var random: Repo {
      Repo(id: .random, name: .random, url: .random)
    }

    public let id: Int
    public let name: String
    public let url: String
  }
}
