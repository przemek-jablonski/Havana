import Casimir
import Foundation

public extension Octokit {
  /// A repository on GitHub.
  struct Repository: ModelProtocol {
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
    public let organization: User?
    /// A GitHub user.
    public let owner: User
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
  }
}
