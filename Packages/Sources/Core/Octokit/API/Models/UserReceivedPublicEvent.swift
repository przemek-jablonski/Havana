import Casimir
import Foundation

/// Event
// MARK: - Event
public struct UserReceivedPublicEvent: ModelProtocol {
  public static var random: Self {
    Self(
      actor: .random,
      createdAt: .random,
      id: .random,
      org: .random,
      payload: .random,
      eventPublic: .random,
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
  public let eventPublic: Bool
  public let repo: Repo
  public let type: String?
}

/// Actor
// MARK: - Actor
public struct Actor: ModelProtocol {
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
public struct Payload: ModelProtocol {
  public static var random: Self {
    Self.init(
      action: .random,
      comment: .random,
      issue: .random,
      pages: .random
    )
  }
  
  public var id: String { "\(action ?? "")\(issue?.id)"}
  
  public let action: String?
  /// Comments provide a way for people to collaborate on an issue.
  public let comment: IssueComment?
  /// Issues are a great way to keep track of tasks, enhancements, and bugs for your projects.
  public let issue: Issue?
  public let pages: [Page]?
}

/// Comments provide a way for people to collaborate on an issue.
// MARK: - IssueComment
public struct IssueComment: ModelProtocol {
  public static var random: Self {
    Self.init(
      authorAssociation: .random,
      body: .random,
      bodyHtml: .random,
      bodyText: .random,
      createdAt: .random,
      htmlUrl: .random,
      id: .random,
      issueUrl: .random,
      nodeId: .random,
      performedViaGithubApp: .random,
      reactions: .random,
      updatedAt: .random,
      url: .random,
      user: .random
    )
  }
  
  /// How the author is associated with the repository.
  public let authorAssociation: AuthorAssociation
  /// Contents of the issue comment
  public let body: String?
  public let bodyHtml: String?
  public let bodyText: String?
  public let createdAt: Date
  public let htmlUrl: String
  /// Unique identifier of the issue comment
  public let id: Int
  public let issueUrl: String
  public let nodeId: String
  public let performedViaGithubApp: CommentGitHubApp?
  public let reactions: Reactions?
  public let updatedAt: Date
  /// URL for the issue comment
  public let url: String
  public let user: GithubUser?
}

/// How the author is associated with the repository.
public enum AuthorAssociation: String, CaseIterable, ModelProtocol {
  public static var random: Self {
    Self.allCases.random
  }
  
  public var id: RawValue { rawValue }
  
  case collaborator
  case contributor
  case firstTimeContributor
  case firstTimer
  case mannequin
  case member
  case none
  case owner
}

/// GitHub apps are a new way to extend GitHub. They can be installed directly on
/// organizations and user accounts and granted access to specific repositories. They come
/// with granular permissions and built-in webhooks. GitHub apps are first class actors
/// within GitHub.
// MARK: - CommentGitHubApp
public struct CommentGitHubApp: ModelProtocol {
  public static var random: Self {
    Self.init(
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
  public let owner: GithubUser?
  public let pem: String?
  /// The set of permissions for the GitHub app
  public let permissions: [String: String]
  /// The slug name of the GitHub app
  public let slug: String?
  public let updatedAt: Date
  public let webhookSecret: String?
}

/// A GitHub user.
// MARK: - GithubUser
public struct GithubUser: ModelProtocol {
  public static var random: Self {
    Self.init(
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
  
  public let avatarUrl: String
  public let email: String?
  public let eventsUrl: String
  public let followersUrl: String
  public let followingUrl: String
  public let gistsUrl: String
  public let gravatarId: String?
  public let htmlUrl: String
  public let id: Int
  public let login: String
  public let name: String?
  public let nodeId: String
  public let organizationsUrl: String
  public let receivedEventsUrl: String
  public let reposUrl: String
  public let siteAdmin: Bool
  public let starredAt: String?
  public let starredUrl: String
  public let subscriptionsUrl: String
  public let type: String
  public let url: String
}

// MARK: - Reactions
public struct Reactions: ModelProtocol {
  public static var random: Self {
    Self.init(
      the1: .random,
      reactionRollup1: .random,
      confused: .random,
      eyes: .random,
      heart: .random,
      hooray: .random,
      laugh: .random,
      rocket: .random,
      totalCount: .random,
      url: .random
    )
  }
  
  public var id: String { url }
  
  public let the1: Int
  public let reactionRollup1: Int
  public let confused: Int
  public let eyes: Int
  public let heart: Int
  public let hooray: Int
  public let laugh: Int
  public let rocket: Int
  public let totalCount: Int
  public let url: String
}

/// Issues are a great way to keep track of tasks, enhancements, and bugs for your projects.
// MARK: - Issue
public struct Issue: ModelProtocol {
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
  public let activeLockReason: String?
  public let assignee: GithubUser?
  public let assignees: [GithubUser]?
  /// How the author is associated with the repository.
  public let authorAssociation: AuthorAssociation
  /// Contents of the issue
  public let body: String?
  public let bodyHtml: String?
  public let bodyText: String?
  public let closedAt: Date?
  public let closedBy: GithubUser?
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
  public let labels: [LabelElement]
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
  public let user: GithubUser?
}

public enum LabelElement: ModelProtocol {
  public static var random: Self {
    Bool.random() ? .string(.random) : .labelClass(.random)
  }
  
  public var id: String {
    switch self {
      case .labelClass(let labelClass): return labelClass.id?.string ?? ""
      case .string(let string): return string
    }
  }
  
  case labelClass(LabelClass)
  case string(String)
}

// MARK: - LabelClass
public struct LabelClass: ModelProtocol {
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
  
  public let color: String?
  public let labelDefault: Bool?
  public let description: String?
  public let id: Int?
  public let name: String?
  public let nodeId: String?
  public let url: String?
}

/// A collection of related issues and pull requests.
// MARK: - Milestone
public struct Milestone: ModelProtocol {
  public static var random: Self {
    Self(
      closedAt: .random,
      closedIssues: .random,
      createdAt: .random,
      creator: .random,
      description: .random,
      dueOn: .random,
      htmlUrl: .random,
      id: .random,
      labelsUrl: .random,
      nodeId: .random,
      number: .random,
      openIssues: .random,
      state: .random,
      title: .random,
      updatedAt: .random,
      url: .random
    )
  }
  
  public let closedAt: Date?
  public let closedIssues: Int
  public let createdAt: Date
  public let creator: GithubUser?
  public let description: String?
  public let dueOn: Date?
  public let htmlUrl: String
  public let id: Int
  public let labelsUrl: String
  public let nodeId: String
  /// The number of the milestone.
  public let number: Int
  public let openIssues: Int
  /// The state of the milestone.
  public let state: State
  /// The title of the milestone.
  public let title: String
  public let updatedAt: Date
  public let url: String
}

/// The state of the milestone.
public enum State: String, ModelProtocol {
  public static var random: Self {
    Bool.random() ? .closed : .stateOpen
  }
  public var id: RawValue { rawValue }
  case closed
  case stateOpen
}

/// GitHub apps are a new way to extend GitHub. They can be installed directly on
/// organizations and user accounts and granted access to specific repositories. They come
/// with granular permissions and built-in webhooks. GitHub apps are first class actors
/// within GitHub.
// MARK: - IssueGitHubApp
public struct IssueGitHubApp: ModelProtocol {
  public static var random: Self {
    Self.init(
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
  public let owner: GithubUser?
  public let pem: String?
  /// The set of permissions for the GitHub app
  public let permissions: [String: String]
  /// The slug name of the GitHub app
  public let slug: String?
  public let updatedAt: Date
  public let webhookSecret: String?
}

// MARK: - PullRequest
public struct PullRequest: ModelProtocol {
  public static var random: Self {
    Self.init(
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


/// A repository on GitHub.
// MARK: - Repository
public struct Repository: ModelProtocol {
  public static var random: Self {
    Self(
      allowAutoMerge: .random,
      allowForking: .random,
      allowMergeCommit: .random,
      allowRebaseMerge: .random,
      allowSquashMerge: .random,
      allowUpdateBranch: .random,
      anonymousAccessEnabled: .random,
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
      forks: .random,
      forksCount: .random,
      forksUrl: .random,
      fullName: .random,
      gitCommitsUrl: .random,
      gitRefsUrl: .random,
      gitTagsUrl: .random,
      gitUrl: .random,
      hasDiscussions: .random,
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
      license: .random,
      masterBranch: .random,
      mergeCommitMessage: .random,
      mergeCommitTitle: .random,
      mergesUrl: .random,
      milestonesUrl: .random,
      mirrorUrl: .random,
      name: .random,
      networkCount: .random,
      nodeId: .random,
      notificationsUrl: .random,
      openIssues: .random,
      openIssuesCount: .random,
      organization: .random,
      owner: .random,
      permissions: .random,
      repositoryPrivate: .random,
      pullsUrl: .random,
      pushedAt: .random,
      releasesUrl: .random,
      size: .random,
      squashMergeCommitMessage: .random,
      squashMergeCommitTitle: .random,
      sshUrl: .random,
      stargazersCount: .random,
      stargazersUrl: .random,
      starredAt: .random,
      statusesUrl: .random,
      subscribersCount: .random,
      subscribersUrl: .random,
      subscriptionUrl: .random,
      svnUrl: .random,
      tagsUrl: .random,
      teamsUrl: .random,
      tempCloneToken: .random,
      templateRepository: .random,
      topics: .random,
      treesUrl: .random,
      updatedAt: .random,
      url: .random,
      useSquashPrTitleAsDefault: .random,
      visibility: .random,
      watchers: .random,
      watchersCount: .random,
      webCommitSignoffRequired: .random
    )
  }
  /// Whether to allow Auto-merge to be used on pull requests.
  public let allowAutoMerge: Bool?
  /// Whether to allow forking this repo
  public let allowForking: Bool?
  /// Whether to allow merge commits for pull requests.
  public let allowMergeCommit: Bool?
  /// Whether to allow rebase merges for pull requests.
  public let allowRebaseMerge: Bool?
  /// Whether to allow squash merges for pull requests.
  public let allowSquashMerge: Bool?
  /// Whether or not a pull request head branch that is behind its base branch can always be
  /// updated even if it is not required to be up to date before merging.
  public let allowUpdateBranch: Bool?
  /// Whether anonymous git access is enabled for this repository
  public let anonymousAccessEnabled: Bool?
  public let archiveUrl: String
  /// Whether the repository is archived.
  public let archived: Bool
  public let assigneesUrl: String
  public let blobsUrl: String
  public let branchesUrl: String
  public let cloneUrl: String
  public let collaboratorsUrl: String
  public let commentsUrl: String
  public let commitsUrl: String
  public let compareUrl: String
  public let contentsUrl: String
  public let contributorsUrl: String
  public let createdAt: Date?
  /// The default branch of the repository.
  public let defaultBranch: String
  /// Whether to delete head branches when pull requests are merged
  public let deleteBranchOnMerge: Bool?
  public let deploymentsUrl: String
  public let description: String?
  /// Returns whether or not this repository disabled.
  public let disabled: Bool
  public let downloadsUrl: String
  public let eventsUrl: String
  public let fork: Bool
  public let forks: Int
  public let forksCount: Int
  public let forksUrl: String
  public let fullName: String
  public let gitCommitsUrl: String
  public let gitRefsUrl: String
  public let gitTagsUrl: String
  public let gitUrl: String
  /// Whether discussions are enabled.
  public let hasDiscussions: Bool?
  /// Whether downloads are enabled.
  public let hasDownloads: Bool
  /// Whether issues are enabled.
  public let hasIssues: Bool
  public let hasPages: Bool
  /// Whether projects are enabled.
  public let hasProjects: Bool
  /// Whether the wiki is enabled.
  public let hasWiki: Bool
  public let homepage: String?
  public let hooksUrl: String
  public let htmlUrl: String
  /// Unique identifier of the repository
  public let id: Int
  /// Whether this repository acts as a template that can be used to generate new repositories.
  public let isTemplate: Bool?
  public let issueCommentUrl: String
  public let issueEventsUrl: String
  public let issuesUrl: String
  public let keysUrl: String
  public let labelsUrl: String
  public let language: String?
  public let languagesUrl: String
  public let license: LicenseSimple?
  public let masterBranch: String?
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
  public let mergesUrl: String
  public let milestonesUrl: String
  public let mirrorUrl: String?
  /// The name of the repository.
  public let name: String
  public let networkCount: Int?
  public let nodeId: String
  public let notificationsUrl: String
  public let openIssues: Int
  public let openIssuesCount: Int
  public let organization: GithubUser?
  /// A GitHub user.
  public let owner: Owner
  public let permissions: RepositoryPermissions?
  /// Whether the repository is private or public.
  public let repositoryPrivate: Bool
  public let pullsUrl: String
  public let pushedAt: Date?
  public let releasesUrl: String
  /// The size of the repository. Size is calculated hourly. When a repository is initially
  /// created, the size is 0.
  public let size: Int
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
  public let sshUrl: String
  public let stargazersCount: Int
  public let stargazersUrl: String
  public let starredAt: String?
  public let statusesUrl: String
  public let subscribersCount: Int?
  public let subscribersUrl: String
  public let subscriptionUrl: String
  public let svnUrl: String
  public let tagsUrl: String
  public let teamsUrl: String
  public let tempCloneToken: String?
  public let templateRepository: TemplateRepository?
  public let topics: [String]?
  public let treesUrl: String
  public let updatedAt: Date?
  public let url: String
  /// Whether a squash merge commit can use the pull request title as default. **This property
  /// has been deprecated. Please use `squash_merge_commit_title` instead.
  public let useSquashPrTitleAsDefault: Bool?
  /// The repository visibility: public, private, or internal.
  public let visibility: String?
  public let watchers: Int
  public let watchersCount: Int
  /// Whether to require contributors to sign off on web-based commits
  public let webCommitSignoffRequired: Bool?
}

/// License Simple
// MARK: - LicenseSimple
public struct LicenseSimple: ModelProtocol {
  public static var random: Self {
    Self.init(
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
public enum MergeCommitMessage: String, CaseIterable, ModelProtocol {
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
public enum MergeCommitTitle: String, CaseIterable, ModelProtocol {
  public static var random: Self {
    Self.allCases.random
  }
  
  public var id: RawValue { rawValue }
  
  case mergeMessage
  case prTitle
}

// MARK: - RepositoryPermissions
public struct RepositoryPermissions: ModelProtocol {
  public static var random: Self {
    Self.init(
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
public enum SquashMergeCommitMessage: String, CaseIterable, ModelProtocol {
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
public enum SquashMergeCommitTitle: String, CaseIterable, ModelProtocol {
  public static var random: Self {
    Self.allCases.random
  }
  
  public var id: RawValue { rawValue }
  case commitOrPrTitle
  case prTitle
}

// MARK: - TemplateRepository
public struct TemplateRepository: ModelProtocol {
  public static var random: Self {
    Self.init(
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
  public let owner: Owner?
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

// MARK: - Owner
public struct Owner: ModelProtocol {
  public static var random: Owner {
    Self.init(
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
}

// MARK: - TemplateRepositoryPermissions
public struct TemplateRepositoryPermissions: ModelProtocol {
  public static var random: Self {
    Self.init(
      admin: .random,
      maintain: .random,
      pull: .random,
      push: .random,
      triage: .random
    )
  }
  
  public var id: Int { -1 }
  
  public let admin: Bool?
  public let maintain: Bool?
  public let pull: Bool?
  public let push: Bool?
  public let triage: Bool?
}

public enum StateReason: String, CaseIterable, ModelProtocol {
  public static var random: StateReason {
    StateReason.allCases.randomElement() ?? .notPlanned
  }
  
  public var id: RawValue { rawValue }
  
  case completed
  case notPlanned
  case reopened
}

// MARK: - Page
public struct Page: ModelProtocol {
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
public struct Repo: ModelProtocol {
  public static var random: Repo {
    Repo(id: .random, name: .random, url: .random)
  }
  
  public let id: Int
  public let name: String
  public let url: String
}

