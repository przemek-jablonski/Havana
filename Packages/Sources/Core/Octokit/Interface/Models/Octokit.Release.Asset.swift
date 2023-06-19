import Casimir
import Foundation

public extension Octokit.Release {
  struct Asset: ModelProtocol {
    public let browserDownloadUrl: String
    public let contentType: String
    public let createdAt: Date
    public let downloadCount: Int
    public let id: Int
    public let label: String?
    public let name: String
    public let nodeId: String?
    public let size: Int
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
