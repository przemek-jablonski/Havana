import Foundation
import Octokit

internal struct EventsDecoder {
  var decodeEvents: (
    _ raw: Data
  ) async throws -> [Octokit.Event]
}
