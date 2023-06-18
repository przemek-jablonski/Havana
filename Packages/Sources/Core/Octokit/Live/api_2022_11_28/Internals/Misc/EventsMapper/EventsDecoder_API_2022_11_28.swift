import Casimir
import Foundation
import Octokit

internal struct EventsDecoder_API_2022_11_28 {
  private let jsonDecoder: JSONDecoder

  internal init(
    jsonDecoder: JSONDecoder
  ) {
    self.jsonDecoder = jsonDecoder
  }
}

extension EventsDecoder_API_2022_11_28: EventsDecoder {
  internal func decodeEvents(
    from data: Data
  ) async -> Result<[Octokit.Event], EventsDecoderError> {
    decodeJsonDictionary(
      from: data
    )
    .compactMap { json in
      try? decode(
        json: json,
        using: jsonDecoder
      )
      .get()
    }
  }

  internal func decodeEvent(from data: Data) async -> Result<Octokit.Event, EventsDecoderError> {
    .failure(.jsonDecodingFailure(GenericError(description: .random())))
    //    .success(.random()) // TODO: TODO
    //    decodeJsonDictionary(from: data)
  }
}

private extension EventsDecoder {
  typealias Json = [String: Any]

  func decodeJsonDictionary(
    from data: Data
  ) -> Result<[Json], EventsDecoderError> {
    Result { try JSONSerialization.jsonObject(with: data) }
      .mapError { .jsonIntoGenericDictionaryParsingFailure($0) }
      .flatMap { jsonDictionary in
        guard let jsonDictionary = jsonDictionary as? [[String: Any]] else {
          return .failure(.jsonIntoGenericDictionaryTypeCastingFailure)
        }
        return .success(jsonDictionary)
      }
  }

  func decode(
    json: [String: Any],
    using jsonDecoder: JSONDecoder
  ) -> Result<Octokit.Event?, EventsDecoderError> {
    guard let eventId = json["id"] as? String else {
      return .failure(.unableToDecodeEventId(json))
    }

    guard let eventType = json["type"] as? String else {
      return .failure(.unableToDecodeEventType(json))
    }

    guard let eventPayload = json["payload"] as? [String: Any] else {
      return .failure(.unableToDecodeEventPayload(json))
    }

    let eventPayloadData: Data
    do {
      eventPayloadData = try JSONSerialization.data(withJSONObject: eventPayload)
    } catch {
      return .failure(.unableToSerializeEventPayload(json, error))
    }

    switch eventType {
      case Octokit.EventType.commitComment.string:
        return jsonDecoder.decode(Octokit.Event.Payload.CommitCommentEventPayload.self, using: eventPayloadData)
          .mapError { .unableToDecodeJsonIntoEventObject(json, $0) }
          .map { .commitCommentEvent(.init(id: eventId, payload: $0)) }
      case Octokit.EventType.create.string:
        return jsonDecoder.decode(Octokit.Event.Payload.CreateEventPayload.self, using: eventPayloadData)
          .mapError { .unableToDecodeJsonIntoEventObject(json, $0) }
          .map { .createEvent(.init(id: eventId, payload: $0)) }
      case Octokit.EventType.delete.string:
        return jsonDecoder.decode(Octokit.Event.Payload.DeleteEventPayload.self, using: eventPayloadData)
          .mapError { .unableToDecodeJsonIntoEventObject(json, $0) }
          .map { .deleteEvent(.init(id: eventId, payload: $0)) }
      case Octokit.EventType.fork.string:
        return jsonDecoder.decode(Octokit.Event.Payload.ForkEventPayload.self, using: eventPayloadData)
          .mapError { .unableToDecodeJsonIntoEventObject(json, $0) }
          .map { .forkEvent(.init(id: eventId, payload: $0)) }
      case Octokit.EventType.gollum.string:
        return jsonDecoder.decode(Octokit.Event.Payload.GollumEventPayload.self, using: eventPayloadData)
          .mapError { .unableToDecodeJsonIntoEventObject(json, $0) }
          .map { .gollumEvent(.init(id: eventId, payload: $0)) }
      case Octokit.EventType.issueComment.string:
        return jsonDecoder.decode(Octokit.Event.Payload.IssueCommentEventPayload.self, using: eventPayloadData)
          .mapError { .unableToDecodeJsonIntoEventObject(json, $0) }
          .map { .issueCommentEvent(.init(id: eventId, payload: $0)) }
      case Octokit.EventType.issues.string:
        return jsonDecoder.decode(Octokit.Event.Payload.IssuesEventPayload.self, using: eventPayloadData)
          .mapError { .unableToDecodeJsonIntoEventObject(json, $0) }
          .map { .issuesEvent(.init(id: eventId, payload: $0)) }
      case Octokit.EventType.member.string:
        return jsonDecoder.decode(Octokit.Event.Payload.MemberEventPayload.self, using: eventPayloadData)
          .mapError { .unableToDecodeJsonIntoEventObject(json, $0) }
          .map { .memberEvent(.init(id: eventId, payload: $0)) }
      case Octokit.EventType.public.string:
        return jsonDecoder.decode(Octokit.Event.Payload.PublicEventPayload.self, using: eventPayloadData)
          .mapError { .unableToDecodeJsonIntoEventObject(json, $0) }
          .map { .publicEvent(.init(id: eventId, payload: $0)) }
      case Octokit.EventType.pullRequest.string:
        return jsonDecoder.decode(Octokit.Event.Payload.PullRequestEventPayload.self, using: eventPayloadData)
          .mapError { .unableToDecodeJsonIntoEventObject(json, $0) }
          .map { .pullRequestEvent(.init(id: eventId, payload: $0)) }
      case Octokit.EventType.pullRequestReview.string:
        return .failure(.unsupportedEventType(Octokit.EventType.pullRequestReview.string, json))
      case Octokit.EventType.pullRequestReviewComment.string:
        return .failure(.unsupportedEventType(Octokit.EventType.pullRequestReviewComment.string, json))
      case Octokit.EventType.pullRequestReviewThread.string:
        return .failure(.unsupportedEventType(Octokit.EventType.pullRequestReviewThread.string, json))
      case Octokit.EventType.push.string:
        return jsonDecoder.decode(Octokit.Event.Payload.PushEventPayload.self, using: eventPayloadData)
          .mapError { .unableToDecodeJsonIntoEventObject(json, $0) }
          .map { .pushEvent(.init(id: eventId, payload: $0)) }
      case Octokit.EventType.release.string:
        return jsonDecoder.decode(Octokit.Event.Payload.ReleaseEventPayload.self, using: eventPayloadData)
          .mapError { .unableToDecodeJsonIntoEventObject(json, $0) }
          .map { .releaseEvent(.init(id: eventId, payload: $0)) }
      case Octokit.EventType.sponsorship.string:
        return jsonDecoder.decode(Octokit.Event.Payload.SponsorshipEventPayload.self, using: eventPayloadData)
          .mapError { .unableToDecodeJsonIntoEventObject(json, $0) }
          .map { .sponsorshipEvent(.init(id: eventId, payload: $0)) }
      case Octokit.EventType.watch.string:
        return jsonDecoder.decode(Octokit.Event.Payload.WatchEventPayload.self, using: eventPayloadData)
          .mapError { .unableToDecodeJsonIntoEventObject(json, $0) }
          .map { .watchEvent(.init(id: eventId, payload: $0)) }
      default:
        return .failure(.unknownEventType(json))
    }
  }
}
