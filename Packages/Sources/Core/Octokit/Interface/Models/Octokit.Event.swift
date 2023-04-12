import Casimir
import Foundation

extension Octokit {
  /// Event
  public struct Event: ModelProtocol {
    public let actor: Actor
    public let createdAt: Date?
    public let id: String
    public let isPublic: Bool
    public let org: Actor?
    public let payload: Payload?
    public let repo: Repo
    public let type: EventType?

    enum CodingKeys: String, CodingKey {
      case actor = "actor"
      case createdAt = "created_at"
      case id = "id"
      case isPublic = "public"
      case org = "org"
      case payload = "payload"
      case repo = "repo"
      case type = "type"
    }

    public static var random: Self {
      Self(
        actor: .random,
        createdAt: .random,
        id: .random,
        isPublic: .random,
        org: .random,
        payload: .random,
        repo: .random,
        type: .random
      )
    }
  }
}

extension Octokit {
  /// Actor
  public struct Actor: ModelProtocol {
    public let avatarUrl: String
    public let displayLogin: String?
    public let gravatarId: String?
    public let id: Int
    public let login: String
    public let url: String

    enum CodingKeys: String, CodingKey {
      case avatarUrl = "avatar_url"
      case displayLogin = "display_login"
      case gravatarId = "gravatar_id"
      case id = "id"
      case login = "login"
      case url = "url"
    }

    public static var random: Self {
      Self(
        avatarUrl: .random,
        displayLogin: .random,
        gravatarId: .random,
        id: .random,
        login: .random,
        url: .random
      )
    }
  }
}

extension Octokit {
  /// Repo
  public struct Repo: ModelProtocol {
    public let id: Int
    public let name: String
    public let url: String

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case name = "name"
      case url = "url"
    }

    public static var random: Repo {
      Self(
        id: .random,
        name: .random,
        url: .random
      )
    }
  }
}
