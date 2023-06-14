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
  internal func decodeEvents(from data: Data) async -> Result<[Octokit.Event], EventsDecoderError> {
    decodeJsonDictionary(from: data)
      .map { jsons in
        jsons.map { json in
          let captured = try! decode(
            json: json,
            using: jsonDecoder
          )
          .get()

          return captured
        }
      }

    //      .flatMap { json in
    //        decode(
    //          json: json,
    //          data: data,
    //          using: jsonDecoder
    //        )
    //      }
    //      .map {
    //        [$0]
    //      }
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
  ) -> Result<Octokit.Event, EventsDecoderError> {
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
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "commitComment")))
      case Octokit.EventType.create.string:
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "create")))
      case Octokit.EventType.delete.string:
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "delete")))
      case Octokit.EventType.fork.string:
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "fork")))
      case Octokit.EventType.gollum.string:
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "gollum")))
      case Octokit.EventType.issueComment.string:
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "issueComment")))
      case Octokit.EventType.issues.string:
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "issues")))
      case Octokit.EventType.member.string:
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "member")))
      case Octokit.EventType.public.string:
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "public")))
      case Octokit.EventType.pullRequest.string:
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "pullRequest")))
      case Octokit.EventType.pullRequestReview.string:
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "pullRequestReview")))
      case Octokit.EventType.pullRequestReviewComment.string:
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "pullRequestReviewComment")))
      case Octokit.EventType.pullRequestReviewThread.string:
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "pullRequestReviewThread")))
      case Octokit.EventType.push.string:
        return jsonDecoder.decode(Octokit.Event.Payload.PushEventPayload.self, using: eventPayloadData)
          .mapError { .unableToDecodeJsonIntoEventObject(json, $0) }
          .map { .pushEvent(.init(id: eventId, payload: $0)) }
      case Octokit.EventType.release.string:
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "release")))
      case Octokit.EventType.sponsorship.string:
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "sponsorship")))
      case Octokit.EventType.watch.string:
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "watch")))
      default:
        return .failure(EventsDecoderError.jsonDecodingFailure(GenericError(description: "UNKNOWN")))
    }
  }
}
