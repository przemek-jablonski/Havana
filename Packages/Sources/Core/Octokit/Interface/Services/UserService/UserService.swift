import Combine

public extension Octokit {
  struct UserService {
    var user: () -> any Publisher<User, NetworkServiceError>
    
    typealias Username = String
    typealias PageNumber = Int
    var receivedPublicEvents: (
      _ username: Username,
      _ page: PageNumber
    ) -> any Publisher<[UserReceivedPublicEvent], NetworkServiceError>
  }
}
