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
  func decodeEvents(from data: Data) async -> Result<[Octokit.Event], Never> {
    .success(.random()) // TODO: TODO
  }

  func decodeEvent(from data: Data) async -> Result<Octokit.Event, EventsDecoderError> {
    .success(.random()) // TODO: TODO
    //    decodeJsonDictionary(from: data)
  }
}

private extension EventsDecoder {
  func decodeJsonDictionary(
    from data: Data
  ) -> Result<[String: Any], EventsDecoderError> {
    Result { try JSONSerialization.jsonObject(with: data) }
      .mapError { .jsonIntoGenericDictionaryParsingFailure($0) }
      .flatMap { jsonDictionary in
        guard let jsonDictionary = jsonDictionary as? [String: Any] else {
          return .failure(.jsonIntoGenericDictionaryTypeCastingFailure)
        }
        return .success(jsonDictionary)
      }
  }

  func decode(json: [String: Any], data: Data, using jsonDecoder: JSONDecoder) -> Result<Octokit.Event, Never> {
    .success(.random()) // TODO: TODO
    //    switch json["type"] as? String {
    //      case Octokit.EventType.commitComment.string:
    //
    //      case Octokit.EventType.create.string:
    //
    //      case Octokit.EventType.delete.string:
    //
    //      case Octokit.EventType.fork.string:
    //
    //      case Octokit.EventType.gollum.string:
    //
    //      case Octokit.EventType.issueComment.string:
    //
    //      case Octokit.EventType.issues.string:
    //
    //      case Octokit.EventType.member.string:
    //
    //      case Octokit.EventType.public.string:
    //
    //      case Octokit.EventType.pullRequest.string:
    //
    //      case Octokit.EventType.pullRequestReview.string:
    //
    //      case Octokit.EventType.pullRequestReviewComment.string:
    //
    //      case Octokit.EventType.pullRequestReviewThread.string:
    //
    //      case Octokit.EventType.push.string:
    //
    //      case Octokit.EventType.release.string:
    //
    //      case Octokit.EventType.sponsorship.string:
    //
    //      case Octokit.EventType.watch.string:
    //
    //      case Octokit.EventType.unknown.string:
    //
    //      default:
    // TODO:
    //    }
  }
}
