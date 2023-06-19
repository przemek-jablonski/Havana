public extension Octokit {
  struct EventsService {
    /**
     List all events, both public and private for the authenticated user.
     */
    public var allEvents: (
      _ username: String,
      _ page: Int
    ) async throws -> [Octokit.Event]

    /**
     List "received" events (events that you've received by watching repos and following users), both public and private for the authenticated user.
     */
    public var receivedEvents: (
      _ username: String,
      _ page: Int
    ) async throws -> [Octokit.Event]
  }
}
