import Casimir
import Foundation

public extension Octokit {
  /// A release.
  struct Release: ModelProtocol {
    public let assets: [Asset]
    public let assetsUrl: String
    /// A GitHub user.
    public let author: UserBrief
    public let body: String?
    public let bodyHtml: String?
    public let bodyText: String?
    public let createdAt: Date
    /// The URL of the release discussion.
    public let discussionUrl: String?
    /// true to create a draft (unpublished) release, false to create a published one.
    public let draft: Bool
    public let htmlUrl: String
    public let id: Int
    public let mentionsCount: Int?
    public let name: String?
    public let nodeId: String?
    /// Whether to identify the release as a prerelease or a full release.
    public let prerelease: Bool
    public let publishedAt: Date?
    public let reactions: Reactions?
    /// The name of the tag.
    public let tagName: String
    public let tarballUrl: String?
    /// Specifies the commitish value that determines where the Git tag is created from.
    public let targetCommitish: String
    public let uploadUrl: String
    public let url: String
    public let zipballUrl: String?

    internal enum CodingKeys: String, CodingKey {
      case assets = "assets"
      case assetsUrl = "assets_url"
      case author = "author"
      case body = "body"
      case bodyHtml = "body_html"
      case bodyText = "body_text"
      case createdAt = "created_at"
      case discussionUrl = "discussion_url"
      case draft = "draft"
      case htmlUrl = "html_url"
      case id = "id"
      case mentionsCount = "mentions_count"
      case name = "name"
      case nodeId = "node_id"
      case prerelease = "prerelease"
      case publishedAt = "published_at"
      case reactions = "reactions"
      case tagName = "tag_name"
      case tarballUrl = "tarball_url"
      case targetCommitish = "target_commitish"
      case uploadUrl = "upload_url"
      case url = "url"
      case zipballUrl = "zipball_url"
    }

    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        assets: .random(),
        assetsUrl: .random(),
        author: .random(),
        body: .random(),
        bodyHtml: .random(),
        bodyText: .random(),
        createdAt: .random(),
        discussionUrl: .random(),
        draft: .random(),
        htmlUrl: .random(),
        id: .random(),
        mentionsCount: .random(),
        name: .random(),
        nodeId: .random(),
        prerelease: .random(),
        publishedAt: .random(),
        reactions: .random(),
        tagName: .random(),
        tarballUrl: .random(),
        targetCommitish: .random(),
        uploadUrl: .random(),
        url: .random(),
        zipballUrl: .random()
      )
    }
  }
}

public extension Octokit.Release {
  /// Data related to a release.
  struct Asset: ModelProtocol {
    public let browserDownloadUrl: String
    public let contentType: String
    public let createdAt: Date
    public let downloadCount: Int
    public let id: Int
    public let label: String?
    /// The file name of the asset.
    public let name: String
    public let nodeId: String?
    public let size: Int
    /// State of the release asset.
    public let state: State?
    public let updatedAt: Date
    public let uploader: Octokit.UserBrief?
    public let url: String

    internal enum CodingKeys: String, CodingKey {
      case browserDownloadUrl = "browser_download_url"
      case contentType = "content_type"
      case createdAt = "created_at"
      case downloadCount = "download_count"
      case id = "id"
      case label = "label"
      case name = "name"
      case nodeId = "node_id"
      case size = "size"
      case state = "state"
      case updatedAt = "updated_at"
      case uploader = "uploader"
      case url = "url"
    }

    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        browserDownloadUrl: .random(),
        contentType: .random(),
        createdAt: .random(),
        downloadCount: .random(),
        id: .random(),
        label: .random(),
        name: .random(),
        nodeId: .random(),
        size: .random(),
        state: .random(),
        updatedAt: .random(),
        uploader: .random(),
        url: .random()
      )
    }
  }
}

public extension Octokit.Release.Asset {
  /// State of the release asset.
  enum State: String, ModelProtocol {
    case stateOpen = "open"
    case uploaded = "uploaded"

    public var id: UUID { UUID() }

    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      [.stateOpen, .uploaded].random()
    }
  }
}
