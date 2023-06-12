public extension Octokit {
  typealias UserService = OctokitUserService
}

public protocol OctokitUserService {
  func user() async -> Result<Octokit.User, Octokit.NetworkServiceError>

  /**
   List all events, both public and private for the authenticated user.
   */
  func events(
    username: String,
    page: Int
  ) async -> Result<[Octokit.Event], Octokit.NetworkServiceError>

  /**
   List "received" events (events that you've received by watching repos and following users), both public and private for the authenticated user.
   */
  func receivedEvents(
    username: String,
    page: Int
  ) async -> Result<[Octokit.Event], Octokit.NetworkServiceError>
}
