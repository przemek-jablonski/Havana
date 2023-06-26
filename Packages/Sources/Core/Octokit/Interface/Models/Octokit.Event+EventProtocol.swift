import Casimir
import Foundation

internal protocol OctokitEventProtocol: Identifiable {
  associatedtype Payload: ModelProtocol
  var id: String { get }
  var actor: Octokit.Event.Actor { get }
  var createdAt: Date { get }
  var isPublic: Bool { get }
  var payload: Payload { get }
  var repository: Octokit.Event.Repository { get }
}

internal extension Octokit.Event {
  typealias EventProtocol = OctokitEventProtocol
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

  var actor: Actor {
    switch self {
      case .commitCommentEvent(let event): return event.actor
      case .createEvent(let event): return event.actor
      case .deleteEvent(let event): return event.actor
      case .forkEvent(let event): return event.actor
      case .gollumEvent(let event): return event.actor
      case .issueCommentEvent(let event): return event.actor
      case .issuesEvent(let event): return event.actor
      case .memberEvent(let event): return event.actor
      case .publicEvent(let event): return event.actor
      case .pullRequestEvent(let event): return event.actor
      case .pushEvent(let event): return event.actor
      case .releaseEvent(let event): return event.actor
      case .sponsorshipEvent(let event): return event.actor
      case .watchEvent(let event): return event.actor
    }
  }

  var createdAt: Date {
    switch self {
      case .commitCommentEvent(let event): return event.createdAt
      case .createEvent(let event): return event.createdAt
      case .deleteEvent(let event): return event.createdAt
      case .forkEvent(let event): return event.createdAt
      case .gollumEvent(let event): return event.createdAt
      case .issueCommentEvent(let event): return event.createdAt
      case .issuesEvent(let event): return event.createdAt
      case .memberEvent(let event): return event.createdAt
      case .publicEvent(let event): return event.createdAt
      case .pullRequestEvent(let event): return event.createdAt
      case .pushEvent(let event): return event.createdAt
      case .releaseEvent(let event): return event.createdAt
      case .sponsorshipEvent(let event): return event.createdAt
      case .watchEvent(let event): return event.createdAt
    }
  }

  var isPublic: Bool {
    switch self {
      case .commitCommentEvent(let event): return event.isPublic
      case .createEvent(let event): return event.isPublic
      case .deleteEvent(let event): return event.isPublic
      case .forkEvent(let event): return event.isPublic
      case .gollumEvent(let event): return event.isPublic
      case .issueCommentEvent(let event): return event.isPublic
      case .issuesEvent(let event): return event.isPublic
      case .memberEvent(let event): return event.isPublic
      case .publicEvent(let event): return event.isPublic
      case .pullRequestEvent(let event): return event.isPublic
      case .pushEvent(let event): return event.isPublic
      case .releaseEvent(let event): return event.isPublic
      case .sponsorshipEvent(let event): return event.isPublic
      case .watchEvent(let event): return event.isPublic
    }
  }

  var repository: Repository {
    switch self {
      case .commitCommentEvent(let event): return event.repository
      case .createEvent(let event): return event.repository
      case .deleteEvent(let event): return event.repository
      case .forkEvent(let event): return event.repository
      case .gollumEvent(let event): return event.repository
      case .issueCommentEvent(let event): return event.repository
      case .issuesEvent(let event): return event.repository
      case .memberEvent(let event): return event.repository
      case .publicEvent(let event): return event.repository
      case .pullRequestEvent(let event): return event.repository
      case .pushEvent(let event): return event.repository
      case .releaseEvent(let event): return event.repository
      case .sponsorshipEvent(let event): return event.repository
      case .watchEvent(let event): return event.repository
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
