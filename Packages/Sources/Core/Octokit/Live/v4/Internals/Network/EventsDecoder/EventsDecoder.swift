import Foundation
import Octokit

internal struct EventsDecoder {
  internal var decodeEvents: (
    _ raw: Data
  ) async throws -> [Octokit.Event]
}
