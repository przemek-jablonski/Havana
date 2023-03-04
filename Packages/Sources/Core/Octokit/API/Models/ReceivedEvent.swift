// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let receivedEvent = try? JSONDecoder().decode([ReceivedEvent].self, from: jsonData)

import Foundation

// MARK: - ReceivedEvent
public struct ReceivedEvent: Codable, Identifiable {
  public let id: String
  public let type: ReceivedEventType
  public let actor: Actor
  public let repo: Repo
  public let payload: Payload
  public let receivedEventPublic: Bool
  public let createdAt: Date
  public let org: Actor?
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case type = "type"
    case actor = "actor"
    case repo = "repo"
    case payload = "payload"
    case receivedEventPublic = "public"
    case createdAt = "created_at"
    case org = "org"
  }
}

// MARK: - Actor
public struct Actor: Codable {
  let id: Int
  let login: String
  let displayLogin: String?
  let gravatarId: String
  let url: String
  let avatarURL: String
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case login = "login"
    case displayLogin = "display_login"
    case gravatarId = "gravatar_id"
    case url = "url"
    case avatarURL = "avatar_url"
  }
}

// MARK: - Payload
public struct Payload: Codable {
  let action: Action?
  let release: Release?
  let ref: JSONNull?
  let refType: String?
  let masterBranch: String?
  let description: String?
  let pusherType: String?
  let forkee: Forkee?
  
  enum CodingKeys: String, CodingKey {
    case action = "action"
    case release = "release"
    case ref = "ref"
    case refType = "ref_type"
    case masterBranch = "master_branch"
    case description = "description"
    case pusherType = "pusher_type"
    case forkee = "forkee"
  }
}

public enum Action: String, Codable {
  case published = "published"
  case started = "started"
}

// MARK: - Forkee
public struct Forkee: Codable {
  public let id: Int
  public let nodeID: String
  public let name: String
  public let fullName: String
  public let forkeePrivate: Bool
  public let owner: Owner
  public let htmlURL: String
  public let description: String
  public let fork: Bool
  public let url: String
  public let forksURL: String
  public let keysURL: String
  public let collaboratorsURL: String
  public let teamsURL: String
  public let hooksURL: String
  public let issueEventsURL: String
  public let eventsURL: String
  public let assigneesURL: String
  public let branchesURL: String
  public let tagsURL: String
  public let blobsURL: String
  public let gitTagsURL: String
  public let gitRefsURL: String
  public let treesURL: String
  public let statusesURL: String
  public let languagesURL: String
  public let stargazersURL: String
  public let contributorsURL: String
  public let subscribersURL: String
  public let subscriptionURL: String
  public let commitsURL: String
  public let gitCommitsURL: String
  public let commentsURL: String
  public let issueCommentURL: String
  public let contentsURL: String
  public let compareURL: String
  public let mergesURL: String
  public let archiveURL: String
  public let downloadsURL: String
  public let issuesURL: String
  public let pullsURL: String
  public let milestonesURL: String
  public let notificationsURL: String
  public let labelsURL: String
  public let releasesURL: String
  public let deploymentsURL: String
  public let createdAt: Date
  public let updatedAt: Date
  public let pushedAt: Date
  public let gitURL: String
  public let sshURL: String
  public let cloneURL: String
  public let svnURL: String
  public let homepage: String?
  public let size: Int
  public let stargazersCount: Int
  public let watchersCount: Int
  public let language: JSONNull?
  public let hasIssues: Bool
  public let hasProjects: Bool
  public let hasDownloads: Bool
  public let hasWiki: Bool
  public let hasPages: Bool
  public let hasDiscussions: Bool
  public let forksCount: Int
  public let mirrorURL: JSONNull?
  public let archived: Bool
  public let disabled: Bool
  public let openIssuesCount: Int
  public let license: License?
  public let allowForking: Bool
  public let isTemplate: Bool
  public let webCommitSignoffRequired: Bool
  public let topics: [JSONAny]
  public let visibility: String
  public let forks: Int
  public let openIssues: Int
  public let watchers: Int
  public let defaultBranch: String
  public let forkeePublic: Bool
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case nodeID = "node_id"
    case name = "name"
    case fullName = "full_name"
    case forkeePrivate = "private"
    case owner = "owner"
    case htmlURL = "html_url"
    case description = "description"
    case fork = "fork"
    case url = "url"
    case forksURL = "forks_url"
    case keysURL = "keys_url"
    case collaboratorsURL = "collaborators_url"
    case teamsURL = "teams_url"
    case hooksURL = "hooks_url"
    case issueEventsURL = "issue_events_url"
    case eventsURL = "events_url"
    case assigneesURL = "assignees_url"
    case branchesURL = "branches_url"
    case tagsURL = "tags_url"
    case blobsURL = "blobs_url"
    case gitTagsURL = "git_tags_url"
    case gitRefsURL = "git_refs_url"
    case treesURL = "trees_url"
    case statusesURL = "statuses_url"
    case languagesURL = "languages_url"
    case stargazersURL = "stargazers_url"
    case contributorsURL = "contributors_url"
    case subscribersURL = "subscribers_url"
    case subscriptionURL = "subscription_url"
    case commitsURL = "commits_url"
    case gitCommitsURL = "git_commits_url"
    case commentsURL = "comments_url"
    case issueCommentURL = "issue_comment_url"
    case contentsURL = "contents_url"
    case compareURL = "compare_url"
    case mergesURL = "merges_url"
    case archiveURL = "archive_url"
    case downloadsURL = "downloads_url"
    case issuesURL = "issues_url"
    case pullsURL = "pulls_url"
    case milestonesURL = "milestones_url"
    case notificationsURL = "notifications_url"
    case labelsURL = "labels_url"
    case releasesURL = "releases_url"
    case deploymentsURL = "deployments_url"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case pushedAt = "pushed_at"
    case gitURL = "git_url"
    case sshURL = "ssh_url"
    case cloneURL = "clone_url"
    case svnURL = "svn_url"
    case homepage = "homepage"
    case size = "size"
    case stargazersCount = "stargazers_count"
    case watchersCount = "watchers_count"
    case language = "language"
    case hasIssues = "has_issues"
    case hasProjects = "has_projects"
    case hasDownloads = "has_downloads"
    case hasWiki = "has_wiki"
    case hasPages = "has_pages"
    case hasDiscussions = "has_discussions"
    case forksCount = "forks_count"
    case mirrorURL = "mirror_url"
    case archived = "archived"
    case disabled = "disabled"
    case openIssuesCount = "open_issues_count"
    case license = "license"
    case allowForking = "allow_forking"
    case isTemplate = "is_template"
    case webCommitSignoffRequired = "web_commit_signoff_required"
    case topics = "topics"
    case visibility = "visibility"
    case forks = "forks"
    case openIssues = "open_issues"
    case watchers = "watchers"
    case defaultBranch = "default_branch"
    case forkeePublic = "public"
  }
}

// MARK: - License
public struct License: Codable {
  let key: String
  let name: String
  let spdxID: String
  let url: String
  let nodeID: String
  
  enum CodingKeys: String, CodingKey {
    case key = "key"
    case name = "name"
    case spdxID = "spdx_id"
    case url = "url"
    case nodeID = "node_id"
  }
}

// MARK: - Owner
public struct Owner: Codable {
  public let login: String
  public let id: Int
  public let nodeID: String
  public let avatarURL: String
  public let gravatarID: String
  public let url: String
  public let htmlURL: String
  public let followersURL: String
  public let followingURL: String
  public let gistsURL: String
  public let starredURL: String
  public let subscriptionsURL: String
  public let organizationsURL: String
  public let reposURL: String
  public let eventsURL: String
  public let receivedEventsURL: String
  public let type: OwnerType
  public let siteAdmin: Bool
  
  enum CodingKeys: String, CodingKey {
    case login = "login"
    case id = "id"
    case nodeID = "node_id"
    case avatarURL = "avatar_url"
    case gravatarID = "gravatar_id"
    case url = "url"
    case htmlURL = "html_url"
    case followersURL = "followers_url"
    case followingURL = "following_url"
    case gistsURL = "gists_url"
    case starredURL = "starred_url"
    case subscriptionsURL = "subscriptions_url"
    case organizationsURL = "organizations_url"
    case reposURL = "repos_url"
    case eventsURL = "events_url"
    case receivedEventsURL = "received_events_url"
    case type = "type"
    case siteAdmin = "site_admin"
  }
}

public enum OwnerType: String, Codable {
  case user = "User"
}

// MARK: - Release
public struct Release: Codable {
  public let url: String
  public let assetsURL: String
  public let uploadURL: String
  public let htmlURL: String
  public let id: Int
  public let author: Owner
  public let nodeID: String
  public let tagName: String
  public let targetCommitish: TargetCommitish
  public let name: String
  public let draft: Bool
  public let prerelease: Bool
  public let createdAt: Date
  public let publishedAt: Date
  public let assets: [Asset]
  public let tarballURL: String
  public let zipballURL: String
  public let body: String
  public let mentionsCount: Int?
  public let mentions: [Mention]?
  public let shortDescriptionHTML: String
  public let isShortDescriptionHTMLTruncated: Bool
  
  enum CodingKeys: String, CodingKey {
    case url = "url"
    case assetsURL = "assets_url"
    case uploadURL = "upload_url"
    case htmlURL = "html_url"
    case id = "id"
    case author = "author"
    case nodeID = "node_id"
    case tagName = "tag_name"
    case targetCommitish = "target_commitish"
    case name = "name"
    case draft = "draft"
    case prerelease = "prerelease"
    case createdAt = "created_at"
    case publishedAt = "published_at"
    case assets = "assets"
    case tarballURL = "tarball_url"
    case zipballURL = "zipball_url"
    case body = "body"
    case mentionsCount = "mentions_count"
    case mentions = "mentions"
    case shortDescriptionHTML = "short_description_html"
    case isShortDescriptionHTMLTruncated = "is_short_description_html_truncated"
  }
}

// MARK: - Asset
public struct Asset: Codable {
  public let url: String
  public let id: Int
  public let nodeID: String
  public let name: String
  public let label: JSONNull?
  public let uploader: Owner
  public let contentType: String
  public let state: String
  public let size: Int
  public let downloadCount: Int
  public let createdAt: Date
  public let updatedAt: Date
  public let browserDownloadURL: String
  
  enum CodingKeys: String, CodingKey {
    case url = "url"
    case id = "id"
    case nodeID = "node_id"
    case name = "name"
    case label = "label"
    case uploader = "uploader"
    case contentType = "content_type"
    case state = "state"
    case size = "size"
    case downloadCount = "download_count"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case browserDownloadURL = "browser_download_url"
  }
}

// MARK: - Mention
public struct Mention: Codable {
  public let avatarURL: String
  public let login: String
  public let profileName: String
  public let profileURL: String
  public let avatarUserActor: Bool
  
  enum CodingKeys: String, CodingKey {
    case avatarURL = "avatar_url"
    case login = "login"
    case profileName = "profile_name"
    case profileURL = "profile_url"
    case avatarUserActor = "avatar_user_actor"
  }
}

public enum TargetCommitish: String, Codable {
  case main = "main"
  case master = "master"
}

// MARK: - Repo
public struct Repo: Codable {
  public let id: Int
  public let name: String
  public let url: String
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case name = "name"
    case url = "url"
  }
}

public enum ReceivedEventType: String, Codable {
  case createEvent = "CreateEvent"
  case forkEvent = "ForkEvent"
  case publicEvent = "PublicEvent"
  case releaseEvent = "ReleaseEvent"
  case watchEvent = "WatchEvent"
}

// MARK: - Encode/decode helpers
