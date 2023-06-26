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
    public let actor: Octokit.Event.Actor
    public let createdAt: Date
    public let isPublic: Bool
    public let payload: Octokit.Event.Payload.CommitCommentEventPayload
    public let repository: Octokit.Event.Repository

    public init(
      id: String,
      actor: Octokit.Event.Actor,
      createdAt: Date,
      isPublic: Bool,
      payload: Octokit.Event.Payload.CommitCommentEventPayload,
      repository: Octokit.Event.Repository
    ) {
      self.id = id
      self.actor = actor
      self.createdAt = createdAt
      self.isPublic = isPublic
      self.payload = payload
      self.repository = repository
    }

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case actor = "actor"
      case createdAt = "created_at"
      case isPublic = "public"
      case payload = "payload"
      case repository = "repo"
    }


    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        actor: .random(),
        createdAt: .random(),
        isPublic: .random(),
        payload: .random(),
        repository: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct CreateEvent: ModelProtocol {
    public let id: String
    public let actor: Octokit.Event.Actor
    public let createdAt: Date
    public let isPublic: Bool
    public let payload: Octokit.Event.Payload.CreateEventPayload
    public let repository: Octokit.Event.Repository

    public init(
      id: String,
      actor: Octokit.Event.Actor,
      createdAt: Date,
      isPublic: Bool,
      payload: Octokit.Event.Payload.CreateEventPayload,
      repository: Octokit.Event.Repository
    ) {
      self.id = id
      self.actor = actor
      self.createdAt = createdAt
      self.isPublic = isPublic
      self.payload = payload
      self.repository = repository
    }

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case actor = "actor"
      case createdAt = "created_at"
      case isPublic = "public"
      case payload = "payload"
      case repository = "repo"
    }


    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        actor: .random(),
        createdAt: .random(),
        isPublic: .random(),
        payload: .random(),
        repository: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct DeleteEvent: ModelProtocol {
    public let id: String
    public let actor: Octokit.Event.Actor
    public let createdAt: Date
    public let isPublic: Bool
    public let payload: Octokit.Event.Payload.DeleteEventPayload
    public let repository: Octokit.Event.Repository

    public init(
      id: String,
      actor: Octokit.Event.Actor,
      createdAt: Date,
      isPublic: Bool,
      payload: Octokit.Event.Payload.DeleteEventPayload,
      repository: Octokit.Event.Repository
    ) {
      self.id = id
      self.actor = actor
      self.createdAt = createdAt
      self.isPublic = isPublic
      self.payload = payload
      self.repository = repository
    }

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case actor = "actor"
      case createdAt = "created_at"
      case isPublic = "public"
      case payload = "payload"
      case repository = "repo"
    }


    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        actor: .random(),
        createdAt: .random(),
        isPublic: .random(),
        payload: .random(),
        repository: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct ForkEvent: ModelProtocol {
    public let id: String
    public let actor: Octokit.Event.Actor
    public let createdAt: Date
    public let isPublic: Bool
    public let payload: Octokit.Event.Payload.ForkEventPayload
    public let repository: Octokit.Event.Repository

    public init(
      id: String,
      actor: Octokit.Event.Actor,
      createdAt: Date,
      isPublic: Bool,
      payload: Octokit.Event.Payload.ForkEventPayload,
      repository: Octokit.Event.Repository
    ) {
      self.id = id
      self.actor = actor
      self.createdAt = createdAt
      self.isPublic = isPublic
      self.payload = payload
      self.repository = repository
    }

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case actor = "actor"
      case createdAt = "created_at"
      case isPublic = "public"
      case payload = "payload"
      case repository = "repo"
    }


    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        actor: .random(),
        createdAt: .random(),
        isPublic: .random(),
        payload: .random(),
        repository: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct GollumEvent: ModelProtocol {
    public let id: String
    public let actor: Octokit.Event.Actor
    public let createdAt: Date
    public let isPublic: Bool
    public let payload: Octokit.Event.Payload.GollumEventPayload
    public let repository: Octokit.Event.Repository

    public init(
      id: String,
      actor: Octokit.Event.Actor,
      createdAt: Date,
      isPublic: Bool,
      payload: Octokit.Event.Payload.GollumEventPayload,
      repository: Octokit.Event.Repository
    ) {
      self.id = id
      self.actor = actor
      self.createdAt = createdAt
      self.isPublic = isPublic
      self.payload = payload
      self.repository = repository
    }

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case actor = "actor"
      case createdAt = "created_at"
      case isPublic = "public"
      case payload = "payload"
      case repository = "repo"
    }


    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        actor: .random(),
        createdAt: .random(),
        isPublic: .random(),
        payload: .random(),
        repository: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct IssueCommentEvent: ModelProtocol {
    public let id: String
    public let actor: Octokit.Event.Actor
    public let createdAt: Date
    public let isPublic: Bool
    public let payload: Octokit.Event.Payload.IssueCommentEventPayload
    public let repository: Octokit.Event.Repository

    public init(
      id: String,
      actor: Octokit.Event.Actor,
      createdAt: Date,
      isPublic: Bool,
      payload: Octokit.Event.Payload.IssueCommentEventPayload,
      repository: Octokit.Event.Repository
    ) {
      self.id = id
      self.actor = actor
      self.createdAt = createdAt
      self.isPublic = isPublic
      self.payload = payload
      self.repository = repository
    }

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case actor = "actor"
      case createdAt = "created_at"
      case isPublic = "public"
      case payload = "payload"
      case repository = "repo"
    }


    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        actor: .random(),
        createdAt: .random(),
        isPublic: .random(),
        payload: .random(),
        repository: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct IssuesEvent: ModelProtocol {
    public let id: String
    public let actor: Octokit.Event.Actor
    public let createdAt: Date
    public let isPublic: Bool
    public let payload: Octokit.Event.Payload.IssuesEventPayload
    public let repository: Octokit.Event.Repository

    public init(
      id: String,
      actor: Octokit.Event.Actor,
      createdAt: Date,
      isPublic: Bool,
      payload: Octokit.Event.Payload.IssuesEventPayload,
      repository: Octokit.Event.Repository
    ) {
      self.id = id
      self.actor = actor
      self.createdAt = createdAt
      self.isPublic = isPublic
      self.payload = payload
      self.repository = repository
    }

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case actor = "actor"
      case createdAt = "created_at"
      case isPublic = "public"
      case payload = "payload"
      case repository = "repo"
    }


    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        actor: .random(),
        createdAt: .random(),
        isPublic: .random(),
        payload: .random(),
        repository: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct MemberEvent: ModelProtocol {
    public let id: String
    public let actor: Octokit.Event.Actor
    public let createdAt: Date
    public let isPublic: Bool
    public let payload: Octokit.Event.Payload.MemberEventPayload
    public let repository: Octokit.Event.Repository

    public init(
      id: String,
      actor: Octokit.Event.Actor,
      createdAt: Date,
      isPublic: Bool,
      payload: Octokit.Event.Payload.MemberEventPayload,
      repository: Octokit.Event.Repository
    ) {
      self.id = id
      self.actor = actor
      self.createdAt = createdAt
      self.isPublic = isPublic
      self.payload = payload
      self.repository = repository
    }

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case actor = "actor"
      case createdAt = "created_at"
      case isPublic = "public"
      case payload = "payload"
      case repository = "repo"
    }


    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        actor: .random(),
        createdAt: .random(),
        isPublic: .random(),
        payload: .random(),
        repository: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct PublicEvent: ModelProtocol {
    public let id: String
    public let actor: Octokit.Event.Actor
    public let createdAt: Date
    public let isPublic: Bool
    public let payload: Octokit.Event.Payload.PublicEventPayload
    public let repository: Octokit.Event.Repository

    public init(
      id: String,
      actor: Octokit.Event.Actor,
      createdAt: Date,
      isPublic: Bool,
      payload: Octokit.Event.Payload.PublicEventPayload,
      repository: Octokit.Event.Repository
    ) {
      self.id = id
      self.actor = actor
      self.createdAt = createdAt
      self.isPublic = isPublic
      self.payload = payload
      self.repository = repository
    }

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case actor = "actor"
      case createdAt = "created_at"
      case isPublic = "public"
      case payload = "payload"
      case repository = "repo"
    }


    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        actor: .random(),
        createdAt: .random(),
        isPublic: .random(),
        payload: .random(),
        repository: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct PullRequestEvent: ModelProtocol {
    public let id: String
    public let actor: Octokit.Event.Actor
    public let createdAt: Date
    public let isPublic: Bool
    public let payload: Octokit.Event.Payload.PullRequestEventPayload
    public let repository: Octokit.Event.Repository

    public init(
      id: String,
      actor: Octokit.Event.Actor,
      createdAt: Date,
      isPublic: Bool,
      payload: Octokit.Event.Payload.PullRequestEventPayload,
      repository: Octokit.Event.Repository
    ) {
      self.id = id
      self.actor = actor
      self.createdAt = createdAt
      self.isPublic = isPublic
      self.payload = payload
      self.repository = repository
    }

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case actor = "actor"
      case createdAt = "created_at"
      case isPublic = "public"
      case payload = "payload"
      case repository = "repo"
    }


    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        actor: .random(),
        createdAt: .random(),
        isPublic: .random(),
        payload: .random(),
        repository: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct PushEvent: ModelProtocol {
    public let id: String
    public let actor: Octokit.Event.Actor
    public let createdAt: Date
    public let isPublic: Bool
    public let payload: Octokit.Event.Payload.PushEventPayload
    public let repository: Octokit.Event.Repository

    public init(
      id: String,
      actor: Octokit.Event.Actor,
      createdAt: Date,
      isPublic: Bool,
      payload: Octokit.Event.Payload.PushEventPayload,
      repository: Octokit.Event.Repository
    ) {
      self.id = id
      self.actor = actor
      self.createdAt = createdAt
      self.isPublic = isPublic
      self.payload = payload
      self.repository = repository
    }

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case actor = "actor"
      case createdAt = "created_at"
      case isPublic = "public"
      case payload = "payload"
      case repository = "repo"
    }


    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        actor: .random(),
        createdAt: .random(),
        isPublic: .random(),
        payload: .random(),
        repository: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct ReleaseEvent: ModelProtocol {
    public let id: String
    public let actor: Octokit.Event.Actor
    public let createdAt: Date
    public let isPublic: Bool
    public let payload: Octokit.Event.Payload.ReleaseEventPayload
    public let repository: Octokit.Event.Repository

    public init(
      id: String,
      actor: Octokit.Event.Actor,
      createdAt: Date,
      isPublic: Bool,
      payload: Octokit.Event.Payload.ReleaseEventPayload,
      repository: Octokit.Event.Repository
    ) {
      self.id = id
      self.actor = actor
      self.createdAt = createdAt
      self.isPublic = isPublic
      self.payload = payload
      self.repository = repository
    }

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case actor = "actor"
      case createdAt = "created_at"
      case isPublic = "public"
      case payload = "payload"
      case repository = "repo"
    }


    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        actor: .random(),
        createdAt: .random(),
        isPublic: .random(),
        payload: .random(),
        repository: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct SponsorshipEvent: ModelProtocol {
    public let id: String
    public let actor: Octokit.Event.Actor
    public let createdAt: Date
    public let isPublic: Bool
    public let payload: Octokit.Event.Payload.SponsorshipEventPayload
    public let repository: Octokit.Event.Repository

    public init(
      id: String,
      actor: Octokit.Event.Actor,
      createdAt: Date,
      isPublic: Bool,
      payload: Octokit.Event.Payload.SponsorshipEventPayload,
      repository: Octokit.Event.Repository
    ) {
      self.id = id
      self.actor = actor
      self.createdAt = createdAt
      self.isPublic = isPublic
      self.payload = payload
      self.repository = repository
    }

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case actor = "actor"
      case createdAt = "created_at"
      case isPublic = "public"
      case payload = "payload"
      case repository = "repo"
    }


    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        actor: .random(),
        createdAt: .random(),
        isPublic: .random(),
        payload: .random(),
        repository: .random()
      )
    }
  }
}

public extension Octokit.Event {
  struct WatchEvent: ModelProtocol {
    public let id: String
    public let actor: Octokit.Event.Actor
    public let createdAt: Date
    public let isPublic: Bool
    public let payload: Octokit.Event.Payload.WatchEventPayload
    public let repository: Octokit.Event.Repository

    public init(
      id: String,
      actor: Octokit.Event.Actor,
      createdAt: Date,
      isPublic: Bool,
      payload: Octokit.Event.Payload.WatchEventPayload,
      repository: Octokit.Event.Repository
    ) {
      self.id = id
      self.actor = actor
      self.createdAt = createdAt
      self.isPublic = isPublic
      self.payload = payload
      self.repository = repository
    }

    enum CodingKeys: String, CodingKey {
      case id = "id"
      case actor = "actor"
      case createdAt = "created_at"
      case isPublic = "public"
      case payload = "payload"
      case repository = "repo"
    }


    public static func random(
      _ randomNumberGenerator: inout RandomNumberGenerator
    ) -> Self {
      Self(
        id: .random(),
        actor: .random(),
        createdAt: .random(),
        isPublic: .random(),
        payload: .random(),
        repository: .random()
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
// swiftlint:enable redundant_string_enum_value
