import Casimir
import Foundation

public extension Octokit {
  struct PullRequest: ModelProtocol {
    public let diffUrl: String?
    public let htmlUrl: String?
    public let mergedAt: Date?
    public let patchUrl: String?
    public let url: String?
    public let id = UUID()

    internal enum CodingKeys: String, CodingKey {
      case diffUrl = "diff_url"
      case htmlUrl = "html_url"
      case mergedAt = "merged_at"
      case patchUrl = "patch_url"
      case url = "url"
    }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Octokit.PullRequest {
      Self(
        diffUrl: .random(),
        htmlUrl: .random(),
        mergedAt: .random(),
        patchUrl: .random(),
        url: .random()
      )
    }
  }
}
