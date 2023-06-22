import Casimir
import Foundation

public extension Octokit {
  struct RepositoryBrief: ModelProtocol {
    public let id: Int
    public let name: String
    public let url: String

    internal enum CodingKeys: String, CodingKey {
      case id = "id"
      case name = "name"
      case url = "url"
    }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        name: .random(),
        url: .random()
      )
    }
  }
}
