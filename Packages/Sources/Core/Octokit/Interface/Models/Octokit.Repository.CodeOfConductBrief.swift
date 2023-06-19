import Casimir
import Foundation

public extension Octokit.Repository {
  struct CodeOfConductBrief: ModelProtocol {
    public let htmlUrl: String?
    public let key: String
    public let name: String
    public let url: String

    public let id = UUID()

    internal enum CodingKeys: String, CodingKey {
      case htmlUrl = "html_url"
      case key = "key"
      case name = "name"
      case url = "url"
    }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        htmlUrl: .random(),
        key: .random(),
        name: .random(),
        url: .random()
      )
    }
  }
}
