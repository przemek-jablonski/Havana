import Casimir
import Foundation

public extension Octokit {
  struct Release: ModelProtocol {
    public let assets: [Asset]
    public let assetsUrl: String
    public let author: UserBrief
    public let body: String?
    public let bodyHtml: String?
    public let bodyText: String?
    public let createdAt: Date
    public let discussionUrl: String?
    public let draft: Bool
    public let htmlUrl: String
    public let id: Int
    public let mentionsCount: Int?
    public let name: String?
    public let nodeId: String?
    public let prerelease: Bool
    public let publishedAt: Date?
    public let reactions: Reactions?
    public let tagName: String
    public let tarballUrl: String?
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

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
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
