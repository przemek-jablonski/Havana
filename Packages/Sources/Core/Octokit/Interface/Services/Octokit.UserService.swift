import Combine

public extension Octokit {
  typealias UserService = OctokitUserService
}

public protocol OctokitUserService {
  func user() async -> Result<Octokit.User, Octokit.NetworkServiceError>
  
  func receivedPublicEvents(
    username: String,
    page: Int
  ) async -> Result<[Octokit.UserReceivedPublicEvent], Octokit.NetworkServiceError>
}
