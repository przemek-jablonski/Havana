import Casimir
import Foundation

/**
 Represents the README object of the repository. The `content` of the Readme is encoded using of the`encoding` type.
 */
public extension Octokit.Repository {
  struct Readme: ModelProtocol {
    public let id = UUID()

    /**
     Name of the readme file (eg. `README.md`).
     */
    public let name: String

    /**
     Encoded content of the readme.
     */
    public let content: String

    /**
     Encoding type used to encode readme contents (eg. `base64`)
     */
    public let encoding: String

    public let path: String?
    public let sha: String?
    public let size: Int?
    public let url: String?
    public let htmlUrl: String?
    public let gitUrl: String?
    public let downloadUrl: String?
    public let type: String?

    enum CodingKeys: String, CodingKey {
      case name = "name"
      case path = "path"
      case sha = "sha"
      case size = "size"
      case url = "url"
      case htmlUrl = "html_url"
      case gitUrl = "git_url"
      case downloadUrl = "download_url"
      case type = "type"
      case content = "content"
      case encoding = "encoding"
    }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        name: .random(),
        content: .random(),
        encoding: .random(),
        path: .random(),
        sha: .random(),
        size: .random(),
        url: .random(),
        htmlUrl: .random(),
        gitUrl: .random(),
        downloadUrl: .random(),
        type: .random()
      )
    }
  }
}
