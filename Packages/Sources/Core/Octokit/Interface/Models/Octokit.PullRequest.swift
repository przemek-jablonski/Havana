import Casimir
import Foundation

extension Octokit {
  public struct PullRequest: ModelProtocol {
    public let diffUrl: String?
    public let htmlUrl: String?
    public let mergedAt: Date?
    public let patchUrl: String?
    public let url: String?

    enum CodingKeys: String, CodingKey {
      case diffUrl = "diff_url"
      case htmlUrl = "html_url"
      case mergedAt = "merged_at"
      case patchUrl = "patch_url"
      case url = "url"
    }

    public let id = UUID()
    public static var random: Self {
      Self(
        diffUrl: .random,
        htmlUrl: .random,
        mergedAt: .random,
        patchUrl: .random,
        url: .random
      )
    }
  }
}
