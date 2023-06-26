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
  struct CommitCommentEvent: EventProtocol, ModelProtocol {
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
  struct CreateEvent: EventProtocol, ModelProtocol {
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
  struct DeleteEvent: EventProtocol, ModelProtocol {
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
  struct ForkEvent: EventProtocol, ModelProtocol {
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
  struct GollumEvent: EventProtocol, ModelProtocol {
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
  struct IssueCommentEvent: EventProtocol, ModelProtocol {
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
  struct IssuesEvent: EventProtocol, ModelProtocol {
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
  struct MemberEvent: EventProtocol, ModelProtocol {
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
  struct PublicEvent: EventProtocol, ModelProtocol {
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
  struct PullRequestEvent: EventProtocol, ModelProtocol {
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
  struct PushEvent: EventProtocol, ModelProtocol {
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
  struct ReleaseEvent: EventProtocol, ModelProtocol {
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
  struct SponsorshipEvent: EventProtocol, ModelProtocol {
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
  struct WatchEvent: EventProtocol, ModelProtocol {
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
// swiftlint:enable redundant_string_enum_value
