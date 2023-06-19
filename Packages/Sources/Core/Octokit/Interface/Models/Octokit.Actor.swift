import Casimir
import Foundation

public extension Octokit {
  struct Actor: ModelProtocol {
    public let avatarUrl: String
    public let displayLogin: String?
    public let gravatarId: String?
    public let id: Int
    public let login: String
    public let url: String

    internal enum CodingKeys: String, CodingKey {
      case avatarUrl = "avatar_url"
      case displayLogin = "display_login"
      case gravatarId = "gravatar_id"
      case id = "id"
      case login = "login"
      case url = "url"
    }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        avatarUrl: .random(),
        displayLogin: .random(),
        gravatarId: .random(),
        id: .random(),
        login: .random(),
        url: .random()
      )
    }
  }
}
