import Casimir
import Foundation

public extension Octokit.User {
  struct Plan: ModelProtocol {
    public var id: String { name }
    public let collaborators: Int
    public let name: String
    public let privateRepos: Int
    public let space: Int

    internal enum CodingKeys: String, CodingKey {
      case collaborators = "collaborators"
      case name = "name"
      case privateRepos = "private_repos"
      case space = "space"
    }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        collaborators: .random(),
        name: .random(),
        privateRepos: .random(),
        space: .random()
      )
    }
  }
}
