import Casimir
import Foundation
import Octokit

internal extension EventsDecoder {
  typealias Json = [String: Any]

  enum DecodingError: Error {
    case unableToSerializeJsonData
    case unableToDecodeEventId(_ json: Json)
    case unableToDecodeEventType(_ json: Json)
    case unableToDecodeEventPayload(_ json: Json)
    case unsupportedEventType(_ type: String, _ json: Json)
    case unknownEventType(_ json: Json)
  }

  static func v4(
    jsonDecoder: JSONDecoder
  ) -> Self {
    Self(
      decodeEvents: { raw in
        (try JSONSerialization.jsonObject(with: raw) as? [Json] ?? { throw DecodingError.unableToSerializeJsonData }())
          .compactMap { json in
            try? decode(
              json: json,
              using: jsonDecoder
            )
          }
      }
    )
  }

  // swiftlint:disable cyclomatic_complexity
  // swiftlint:disable function_body_length
  private static func decode(
    json: Json,
    using jsonDecoder: JSONDecoder
  ) throws -> Octokit.Event? {
    guard let eventId = json["id"] as? String else {
      throw DecodingError.unableToDecodeEventId(json)
    }

    guard let eventType = json["type"] as? String else {
      throw DecodingError.unableToDecodeEventType(json)
    }

    guard let eventPayload = json["payload"] as? [String: Any] else {
      throw DecodingError.unableToDecodeEventPayload(json)
    }

    let eventPayloadData = try JSONSerialization.data(withJSONObject: eventPayload)

    switch eventType {
    case Octokit.EventType.commitComment.string:
      return .commitCommentEvent(
        .init(
          id: eventId,
          payload: try jsonDecoder.decode(
            Octokit.Event.Payload.CommitCommentEventPayload.self,
            from: eventPayloadData
          )
        )
      )
    case Octokit.EventType.create.string:
      return .createEvent(
        .init(
          id: eventId,
          payload: try jsonDecoder.decode(
            Octokit.Event.Payload.CreateEventPayload.self,
            from: eventPayloadData
          )
        )
      )
    case Octokit.EventType.delete.string:
      return .deleteEvent(
        .init(
          id: eventId,
          payload: try jsonDecoder.decode(
            Octokit.Event.Payload.DeleteEventPayload.self,
            from: eventPayloadData
          )
        )
      )
    case Octokit.EventType.fork.string:
      return .forkEvent(
        .init(
          id: eventId,
          payload: try jsonDecoder.decode(
            Octokit.Event.Payload.ForkEventPayload.self,
            from: eventPayloadData
          )
        )
      )
    case Octokit.EventType.gollum.string:
      return .gollumEvent(
        .init(
          id: eventId,
          payload: try jsonDecoder.decode(
            Octokit.Event.Payload.GollumEventPayload.self,
            from: eventPayloadData
          )
        )
      )
    case Octokit.EventType.issueComment.string:
      return .issueCommentEvent(
        .init(
          id: eventId,
          payload: try jsonDecoder.decode(
            Octokit.Event.Payload.IssueCommentEventPayload.self,
            from: eventPayloadData
          )
        )
      )
    case Octokit.EventType.issues.string:
      return .issuesEvent(
        .init(
          id: eventId,
          payload: try jsonDecoder.decode(
            Octokit.Event.Payload.IssuesEventPayload.self,
            from: eventPayloadData
          )
        )
      )
    case Octokit.EventType.member.string:
      return .memberEvent(
        .init(
          id: eventId,
          payload: try jsonDecoder.decode(
            Octokit.Event.Payload.MemberEventPayload.self,
            from: eventPayloadData
          )
        )
      )
    case Octokit.EventType.public.string:
      return .publicEvent(
        .init(
          id: eventId,
          payload: try jsonDecoder.decode(
            Octokit.Event.Payload.PublicEventPayload.self,
            from: eventPayloadData
          )
        )
      )
    case Octokit.EventType.pullRequest.string:
      return .pullRequestEvent(
        .init(
          id: eventId,
          payload: try jsonDecoder.decode(
            Octokit.Event.Payload.PullRequestEventPayload.self,
            from: eventPayloadData
          )
        )
      )
    case Octokit.EventType.pullRequestReview.string:
      throw EventsDecoder.DecodingError.unsupportedEventType(Octokit.EventType.pullRequestReview.string, json)
    case Octokit.EventType.pullRequestReviewComment.string:
      throw EventsDecoder.DecodingError.unsupportedEventType(Octokit.EventType.pullRequestReviewComment.string, json)
    case Octokit.EventType.pullRequestReviewThread.string:
      throw EventsDecoder.DecodingError.unsupportedEventType(Octokit.EventType.pullRequestReviewThread.string, json)
    case Octokit.EventType.push.string:
      return .pushEvent(
        .init(
          id: eventId,
          payload: try jsonDecoder.decode(
            Octokit.Event.Payload.PushEventPayload.self,
            from: eventPayloadData
          )
        )
      )
    case Octokit.EventType.release.string:
      return .releaseEvent(
        .init(
          id: eventId,
          payload: try jsonDecoder.decode(
            Octokit.Event.Payload.ReleaseEventPayload.self,
            from: eventPayloadData
          )
        )
      )
    case Octokit.EventType.sponsorship.string:
      return .sponsorshipEvent(
        .init(
          id: eventId,
          payload: try jsonDecoder.decode(
            Octokit.Event.Payload.SponsorshipEventPayload.self,
            from: eventPayloadData
          )
        )
      )
    case Octokit.EventType.watch.string:
      return .watchEvent(
        .init(
          id: eventId,
          payload: try jsonDecoder.decode(
            Octokit.Event.Payload.WatchEventPayload.self,
            from: eventPayloadData
          )
        )
      )
    default:
      throw EventsDecoder.DecodingError.unknownEventType(json)
    }
  }
  // swiftlint:enable cyclomatic_complexity
  // swiftlint:enable function_body_length
}
