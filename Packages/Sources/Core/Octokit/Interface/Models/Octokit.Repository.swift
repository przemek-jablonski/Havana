import Casimir
import Foundation

// swiftlint:disable redundant_string_enum_value
// swiftlint:disable file_length
// swiftlint:disable type_body_length
// swiftlint:disable inclusive_language
// swiftlint:disable discouraged_optional_boolean
// swiftlint:disable discouraged_optional_collection
public extension Octokit {
  /// Full Repository
  struct Repository: ModelProtocol {
    public let allowAutoMerge: Bool?
    public let allowForking: Bool?
    public let allowMergeCommit: Bool?
    public let allowRebaseMerge: Bool?
    public let allowSquashMerge: Bool?
    public let allowUpdateBranch: Bool?
    public let anonymousAccessEnabled: Bool?
    public let archiveUrl: String
    public let archived: Bool
    public let assigneesUrl: String
    public let blobsUrl: String
    public let branchesUrl: String
    public let cloneUrl: String
    public let codeOfConduct: CodeOfConductBrief?
    public let collaboratorsUrl: String
    public let commentsUrl: String
    public let commitsUrl: String
    public let compareUrl: String
    public let contentsUrl: String
    public let contributorsUrl: String
    public let createdAt: Date
    public let defaultBranch: String
    public let deleteBranchOnMerge: Bool?
    public let deploymentsUrl: String
    public let description: String?
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
    public let hasDiscussions: Bool
    public let hasDownloads: Bool
    public let hasIssues: Bool
    public let hasPages: Bool
    public let hasProjects: Bool
    public let hasWiki: Bool
    public let homepage: String?
    public let hooksUrl: String
    public let htmlUrl: String
    public let id: Int
    public let isTemplate: Bool?
    public let issueCommentUrl: String
    public let issueEventsUrl: String
    public let issuesUrl: String
    public let keysUrl: String
    public let labelsUrl: String
    public let language: String?
    public let languagesUrl: String
    public let license: License?
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
    public let name: String
    public let networkCount: Int?
    public let nodeId: String?
    public let notificationsUrl: String
    public let openIssues: Int
    public let openIssuesCount: Int
    public let organization: UserBrief?
    /// A GitHub user.
    public let owner: UserBrief
    public let permissions: Permissions?
    public let repositoryPrivate: Bool
    public let pullsUrl: String
    public let pushedAt: Date
    public let releasesUrl: String
    public let securityAndAnalysis: SecurityAndAnalysis?
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
    public let statusesUrl: String
    public let subscribersCount: Int?
    public let subscribersUrl: String
    public let subscriptionUrl: String
    public let svnUrl: String
    public let tagsUrl: String
    public let teamsUrl: String
    public let tempCloneToken: String?
    public let topics: [String]?
    public let treesUrl: String
    public let updatedAt: Date
    public let url: String
    public let useSquashPrTitleAsDefault: Bool?
    /// The repository visibility: public, private, or internal.
    public let visibility: String?
    public let watchers: Int
    public let watchersCount: Int
    public let webCommitSignoffRequired: Bool?

    internal enum CodingKeys: String, CodingKey {
      case allowAutoMerge = "allow_auto_merge"
      case allowForking = "allow_forking"
      case allowMergeCommit = "allow_merge_commit"
      case allowRebaseMerge = "allow_rebase_merge"
      case allowSquashMerge = "allow_squash_merge"
      case allowUpdateBranch = "allow_update_branch"
      case anonymousAccessEnabled = "anonymous_access_enabled"
      case archiveUrl = "archive_url"
      case archived = "archived"
      case assigneesUrl = "assignees_url"
      case blobsUrl = "blobs_url"
      case branchesUrl = "branches_url"
      case cloneUrl = "clone_url"
      case codeOfConduct = "code_of_conduct"
      case collaboratorsUrl = "collaborators_url"
      case commentsUrl = "comments_url"
      case commitsUrl = "commits_url"
      case compareUrl = "compare_url"
      case contentsUrl = "contents_url"
      case contributorsUrl = "contributors_url"
      case createdAt = "created_at"
      case defaultBranch = "default_branch"
      case deleteBranchOnMerge = "delete_branch_on_merge"
      case deploymentsUrl = "deployments_url"
      case description = "description"
      case disabled = "disabled"
      case downloadsUrl = "downloads_url"
      case eventsUrl = "events_url"
      case fork = "fork"
      case forks = "forks"
      case forksCount = "forks_count"
      case forksUrl = "forks_url"
      case fullName = "full_name"
      case gitCommitsUrl = "git_commits_url"
      case gitRefsUrl = "git_refs_url"
      case gitTagsUrl = "git_tags_url"
      case gitUrl = "git_url"
      case hasDiscussions = "has_discussions"
      case hasDownloads = "has_downloads"
      case hasIssues = "has_issues"
      case hasPages = "has_pages"
      case hasProjects = "has_projects"
      case hasWiki = "has_wiki"
      case homepage = "homepage"
      case hooksUrl = "hooks_url"
      case htmlUrl = "html_url"
      case id = "id"
      case isTemplate = "is_template"
      case issueCommentUrl = "issue_comment_url"
      case issueEventsUrl = "issue_events_url"
      case issuesUrl = "issues_url"
      case keysUrl = "keys_url"
      case labelsUrl = "labels_url"
      case language = "language"
      case languagesUrl = "languages_url"
      case license = "license"
      case masterBranch = "master_branch"
      case mergeCommitMessage = "merge_commit_message"
      case mergeCommitTitle = "merge_commit_title"
      case mergesUrl = "merges_url"
      case milestonesUrl = "milestones_url"
      case mirrorUrl = "mirror_url"
      case name = "name"
      case networkCount = "network_count"
      case nodeId = "node_id"
      case notificationsUrl = "notifications_url"
      case openIssues = "open_issues"
      case openIssuesCount = "open_issues_count"
      case organization = "organization"
      case owner = "owner"
      case permissions = "permissions"
      case repositoryPrivate = "private"
      case pullsUrl = "pulls_url"
      case pushedAt = "pushed_at"
      case releasesUrl = "releases_url"
      case securityAndAnalysis = "security_and_analysis"
      case size = "size"
      case squashMergeCommitMessage = "squash_merge_commit_message"
      case squashMergeCommitTitle = "squash_merge_commit_title"
      case sshUrl = "ssh_url"
      case stargazersCount = "stargazers_count"
      case stargazersUrl = "stargazers_url"
      case statusesUrl = "statuses_url"
      case subscribersCount = "subscribers_count"
      case subscribersUrl = "subscribers_url"
      case subscriptionUrl = "subscription_url"
      case svnUrl = "svn_url"
      case tagsUrl = "tags_url"
      case teamsUrl = "teams_url"
      case tempCloneToken = "temp_clone_token"
      case topics = "topics"
      case treesUrl = "trees_url"
      case updatedAt = "updated_at"
      case url = "url"
      case useSquashPrTitleAsDefault = "use_squash_pr_title_as_default"
      case visibility = "visibility"
      case watchers = "watchers"
      case watchersCount = "watchers_count"
      case webCommitSignoffRequired = "web_commit_signoff_required"
    }

    // swiftlint:disable function_body_length
    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        allowAutoMerge: .random(),
        allowForking: .random(),
        allowMergeCommit: .random(),
        allowRebaseMerge: .random(),
        allowSquashMerge: .random(),
        allowUpdateBranch: .random(),
        anonymousAccessEnabled: .random(),
        archiveUrl: .random(),
        archived: .random(),
        assigneesUrl: .random(),
        blobsUrl: .random(),
        branchesUrl: .random(),
        cloneUrl: .random(),
        codeOfConduct: .random(),
        collaboratorsUrl: .random(),
        commentsUrl: .random(),
        commitsUrl: .random(),
        compareUrl: .random(),
        contentsUrl: .random(),
        contributorsUrl: .random(),
        createdAt: .random(),
        defaultBranch: .random(),
        deleteBranchOnMerge: .random(),
        deploymentsUrl: .random(),
        description: .random(),
        disabled: .random(),
        downloadsUrl: .random(),
        eventsUrl: .random(),
        fork: .random(),
        forks: .random(),
        forksCount: .random(),
        forksUrl: .random(),
        fullName: .random(),
        gitCommitsUrl: .random(),
        gitRefsUrl: .random(),
        gitTagsUrl: .random(),
        gitUrl: .random(),
        hasDiscussions: .random(),
        hasDownloads: .random(),
        hasIssues: .random(),
        hasPages: .random(),
        hasProjects: .random(),
        hasWiki: .random(),
        homepage: .random(),
        hooksUrl: .random(),
        htmlUrl: .random(),
        id: .random(),
        isTemplate: .random(),
        issueCommentUrl: .random(),
        issueEventsUrl: .random(),
        issuesUrl: .random(),
        keysUrl: .random(),
        labelsUrl: .random(),
        language: .random(),
        languagesUrl: .random(),
        license: .random(),
        masterBranch: .random(),
        mergeCommitMessage: .random(),
        mergeCommitTitle: .random(),
        mergesUrl: .random(),
        milestonesUrl: .random(),
        mirrorUrl: .random(),
        name: .random(),
        networkCount: .random(),
        nodeId: .random(),
        notificationsUrl: .random(),
        openIssues: .random(),
        openIssuesCount: .random(),
        organization: .random(),
        owner: .random(),
        permissions: .random(),
        repositoryPrivate: .random(),
        pullsUrl: .random(),
        pushedAt: .random(),
        releasesUrl: .random(),
        securityAndAnalysis: .random(),
        size: .random(),
        squashMergeCommitMessage: .random(),
        squashMergeCommitTitle: .random(),
        sshUrl: .random(),
        stargazersCount: .random(),
        stargazersUrl: .random(),
        statusesUrl: .random(),
        subscribersCount: .random(),
        subscribersUrl: .random(),
        subscriptionUrl: .random(),
        svnUrl: .random(),
        tagsUrl: .random(),
        teamsUrl: .random(),
        tempCloneToken: .random(),
        topics: .random(),
        treesUrl: .random(),
        updatedAt: .random(),
        url: .random(),
        useSquashPrTitleAsDefault: .random(),
        visibility: .random(),
        watchers: .random(),
        watchersCount: .random(),
        webCommitSignoffRequired: .random()
      )
    }
    // swiftlint:enable function_body_length
  }
}
// swiftlint:enable redundant_string_enum_value
// swiftlint:enable type_body_length
// swiftlint:enable inclusive_language
// swiftlint:enable discouraged_optional_boolean
// swiftlint:enable discouraged_optional_collection
// swiftlint:enable file_length
