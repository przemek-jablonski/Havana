import Casimir
import Foundation

// swiftlint:disable redundant_string_enum_value

public extension Octokit {
  enum Event: ModelProtocol {
    case commitCommentEvent(CommitCommentEvent)
    case createEvent(CreateEvent)
    case deleteEvent(DeleteEvent)
    case forkEvent(ForkEvent)
    case gollumEvent(GollumEvent)
    case issueCommentEvent(IssueCommentEvent)
    case issuesEvent(IssuesEvent)
    case memberEvent(MemberEvent)
    case publicEvent(PublicEvent)
    case pullRequestEvent(PullRequestEvent)
    case pushEvent(PushEvent)
    case releaseEvent(ReleaseEvent)
    case sponsorshipEvent(SponsorshipEvent)
    case watchEvent(WatchEvent)
  }
}

public extension Octokit.Event {
  struct CommitCommentEvent: ModelProtocol {
    public let id: String
    public let payload: Octokit.Event.Payload.CommitCommentEventPayload
    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        id: .random(),
        payload: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct CreateEvent: ModelProtocol {
    public let id: String
    public let payload: Octokit.Event.Payload.CreateEventPayload
    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        id: .random(),
        payload: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct DeleteEvent: ModelProtocol {
    public let id: String
    public let payload: Octokit.Event.Payload.DeleteEventPayload
    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        id: .random(),
        payload: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct ForkEvent: ModelProtocol {
    public let id: String
    public let payload: Octokit.Event.Payload.ForkEventPayload
    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        id: .random(),
        payload: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct GollumEvent: ModelProtocol {
    public let id: String
    public let payload: Octokit.Event.Payload.GollumEventPayload
    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        id: .random(),
        payload: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct IssueCommentEvent: ModelProtocol {
    public let id: String
    public let payload: Octokit.Event.Payload.IssueCommentEventPayload
    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        id: .random(),
        payload: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct IssuesEvent: ModelProtocol {
    public let id: String
    public let payload: Octokit.Event.Payload.IssuesEventPayload
    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        id: .random(),
        payload: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct MemberEvent: ModelProtocol {
    public let id: String
    public let payload: Octokit.Event.Payload.MemberEventPayload
    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        id: .random(),
        payload: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct PublicEvent: ModelProtocol {
    public let id: String
    public let payload: Octokit.Event.Payload.PublicEventPayload
    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        id: .random(),
        payload: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct PullRequestEvent: ModelProtocol {
    public let id: String
    public let payload: Octokit.Event.Payload.PullRequestEventPayload

    public init(
      id: String,
      payload: Octokit.Event.Payload.PullRequestEventPayload
    ) {
      self.id = id
      self.payload = payload
    }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        payload: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct PushEvent: ModelProtocol {
    public let id: String
    public let payload: Octokit.Event.Payload.PushEventPayload

    public init(
      id: String,
      payload: Octokit.Event.Payload.PushEventPayload
    ) {
      self.id = id
      self.payload = payload
    }

    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        payload: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct ReleaseEvent: ModelProtocol {
    public let id: String
    public let payload: Octokit.Event.Payload.ReleaseEventPayload
    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        id: .random(),
        payload: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct SponsorshipEvent: ModelProtocol {
    public let id: String
    public let payload: Octokit.Event.Payload.SponsorshipEventPayload
    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        id: .random(),
        payload: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct WatchEvent: ModelProtocol {
    public let id: String
    public let payload: Octokit.Event.Payload.WatchEventPayload
    public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
      Self(
        id: .random(),
        payload: .random()
      )
    }
  }
}

public extension Octokit.Event {
  var id: String {
    switch self {
      case .commitCommentEvent(let event): return event.id
      case .createEvent(let event): return event.id
      case .deleteEvent(let event): return event.id
      case .forkEvent(let event): return event.id
      case .gollumEvent(let event): return event.id
      case .issueCommentEvent(let event): return event.id
      case .issuesEvent(let event): return event.id
      case .memberEvent(let event): return event.id
      case .publicEvent(let event): return event.id
      case .pullRequestEvent(let event): return event.id
      case .pushEvent(let event): return event.id
      case .releaseEvent(let event): return event.id
      case .sponsorshipEvent(let event): return event.id
      case .watchEvent(let event): return event.id
    }
  }

  static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    [
      .commitCommentEvent(.random()),
      .createEvent(.random()),
      .deleteEvent(.random()),
      .forkEvent(.random()),
      .gollumEvent(.random()),
      .issueCommentEvent(.random()),
      .issuesEvent(.random()),
      .memberEvent(.random()),
      .publicEvent(.random()),
      .pullRequestEvent(.random()),
      .pushEvent(.random()),
      .releaseEvent(.random()),
      .sponsorshipEvent(.random()),
      .watchEvent(.random())
    ].random()
  }
}

public extension Octokit {
  /// Actor
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

public extension Octokit {
  /// Repo
  struct Repo: ModelProtocol {
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
    ) -> Octokit.Repo {
      Self(
        id: .random(),
        name: .random(),
        url: .random()
      )
    }
  }
}

// swiftlint:enable redundant_string_enum_value
