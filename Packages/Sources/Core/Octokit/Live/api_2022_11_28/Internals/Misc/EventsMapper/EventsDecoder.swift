import Foundation
import Octokit

internal protocol EventsDecoder {
  /**
   Decodes the raw `Data` into the `Event` object, with proper mapping between `event.type` and it's corresponding `event.payload`.
   */
  func decodeEvent(from data: Data) async -> Result<Octokit.Event, EventsDecoderError>

  /**
   Decodes the raw `Data` into the `Event`s array, with proper mapping between `event.type` and it's corresponding `event.payload`.

   - Note: If decoding of any `Event` object fails, then the error is not thrown. Instead the array becomes shorter and doesn't include faulty object.
   */
  func decodeEvents(from data: Data) async -> Result<[Octokit.Event], EventsDecoderError>
}

// TODO: this should be inside implementation class
internal enum EventsDecoderError: Error {
  case jsonIntoGenericDictionaryParsingFailure(Error)
  case jsonIntoGenericDictionaryTypeCastingFailure
  case jsonDecodingFailure(Error)

  case unableToDecodeEventId(_ json: [String: Any])
  case unableToDecodeEventType(_ json: [String: Any])
  case unableToDecodeEventPayload(_ json: [String: Any])
  case unableToSerializeEventPayload(_ json: [String: Any], _ underlyingError: Error)
  case unableToDecodeJsonIntoEventObject(_ json: [String: Any], _ underlyingError: Error)
}
