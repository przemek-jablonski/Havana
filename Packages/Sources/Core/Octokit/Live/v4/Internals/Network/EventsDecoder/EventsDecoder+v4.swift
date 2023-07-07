import Casimir
import Foundation
import Octokit

extension EventsDecoder {
  internal typealias Json = [String: Any]

  internal enum DecodingError: Error {
    case unableToSerializeJsonData
    case unableToDecodeEventType(_ json: Json)
    case unsupportedEventType(_ type: String, _ json: Json)
    case unknownEventType(_ json: Json)
  }

  internal static func v4(
    jsonDecoder: JSONDecoder
  ) -> Self {
    Self(
      decodeEvents: { raw in
        (
          try JSONSerialization.jsonObject(with: raw) as? [Json] ?? {
            throw DecodingError.unableToSerializeJsonData
          }()
        )
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
    switch json["type"] as? String {
    case Octokit.EventType.commitComment.string:
      return .commitCommentEvent(
        try jsonDecoder.decode(
          Octokit.Event.CommitCommentEvent.self,
          from: try JSONSerialization.data(withJSONObject: json)
        )
      )
    case Octokit.EventType.create.string:
      return .createEvent(
        try jsonDecoder.decode(
          Octokit.Event.CreateEvent.self,
          from: try JSONSerialization.data(withJSONObject: json)
        )
      )
    case Octokit.EventType.delete.string:
      return .deleteEvent(
        try jsonDecoder.decode(
          Octokit.Event.DeleteEvent.self,
          from: try JSONSerialization.data(withJSONObject: json)
        )
      )
    case Octokit.EventType.fork.string:
      return .forkEvent(
        try jsonDecoder.decode(
          Octokit.Event.ForkEvent.self,
          from: try JSONSerialization.data(withJSONObject: json)
        )
      )
    case Octokit.EventType.gollum.string:
      return .gollumEvent(
        try jsonDecoder.decode(
          Octokit.Event.GollumEvent.self,
          from: try JSONSerialization.data(withJSONObject: json)
        )
      )
    case Octokit.EventType.issueComment.string:
      return .issueCommentEvent(
        try jsonDecoder.decode(
          Octokit.Event.IssueCommentEvent.self,
          from: try JSONSerialization.data(withJSONObject: json)
        )
      )
    case Octokit.EventType.issues.string:
      return .issuesEvent(
        try jsonDecoder.decode(
          Octokit.Event.IssuesEvent.self,
          from: try JSONSerialization.data(withJSONObject: json)
        )
      )
    case Octokit.EventType.member.string:
      return .memberEvent(
        try jsonDecoder.decode(
          Octokit.Event.MemberEvent.self,
          from: try JSONSerialization.data(withJSONObject: json)
        )
      )
    case Octokit.EventType.public.string:
      return .publicEvent(
        try jsonDecoder.decode(
          Octokit.Event.PublicEvent.self,
          from: try JSONSerialization.data(withJSONObject: json)
        )
      )
    case Octokit.EventType.pullRequest.string:
      return .pullRequestEvent(
        try jsonDecoder.decode(
          Octokit.Event.PullRequestEvent.self,
          from: try JSONSerialization.data(withJSONObject: json)
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
        try jsonDecoder.decode(
          Octokit.Event.PushEvent.self,
          from: try JSONSerialization.data(withJSONObject: json)
        )
      )
    case Octokit.EventType.release.string:
      return .releaseEvent(
        try jsonDecoder.decode(
          Octokit.Event.ReleaseEvent.self,
          from: try JSONSerialization.data(withJSONObject: json)
        )
      )
    case Octokit.EventType.sponsorship.string:
      return .sponsorshipEvent(
        try jsonDecoder.decode(
          Octokit.Event.SponsorshipEvent.self,
          from: try JSONSerialization.data(withJSONObject: json)
        )
      )
    case Octokit.EventType.watch.string:
      return .watchEvent(
        try jsonDecoder.decode(
          Octokit.Event.WatchEvent.self,
          from: try JSONSerialization.data(withJSONObject: json)
        )
      )
    case nil: // `nil` meaning that this json object didn't had a field with this key at all.
      throw EventsDecoder.DecodingError.unableToDecodeEventType(json)
    default:
      throw EventsDecoder.DecodingError.unknownEventType(json)
    }
  }
  // swiftlint:enable cyclomatic_complexity
  // swiftlint:enable function_body_length
}
