public extension Octokit {
  struct EventsService {
    /**
     List all events, both public and private for the authenticated user.
     */
    public var allPublicEvents: (
      _ page: Int
    ) async throws -> [Octokit.Event]

    /**
     List "received" events (events that you've received by watching repos and following users), both public and private for the authenticated user.
     */
    public var userEvents: (
      _ username: String,
      _ page: Int
    ) async throws -> [Octokit.Event]

    public init(
      allPublicEvents: @escaping (_ page: Int) async throws -> [Octokit.Event],
      userEvents: @escaping (_ username: String, _ page: Int) async throws -> [Octokit.Event]
    ) {
      self.allPublicEvents = allPublicEvents
      self.userEvents = userEvents
    }
  }
}
