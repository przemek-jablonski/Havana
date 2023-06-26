import Casimir

public extension Octokit.Event {
  struct Actor: ModelProtocol {
    public let id: Int
    public let login: String
    public let displayLogin: String
    public let gravatarId: String
    public let url: String
    public let avatarUrl: String

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case login = "login"
      case displayLogin = "display_login"
      case gravatarId = "gravatar_id"
      case url = "url"
      case avatarUrl = "avatar_url"
    }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        login: .random(),
        displayLogin: .random(),
        gravatarId: .random(),
        url: .random(),
        avatarUrl: .random()
      )
    }
  }
}
