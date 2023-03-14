import Combine

public extension Octokit {
  struct UserService {
    public var user: () -> any Publisher<User, NetworkServiceError>
  
    public typealias ReceivedPublicEventsPayload = (username: String, page: Int)
    public var receivedPublicEvents: (ReceivedPublicEventsPayload) -> any Publisher<[UserReceivedPublicEvent], NetworkServiceError>
    
    internal init(
      user: @escaping () -> any Publisher<User, NetworkServiceError>,
      receivedPublicEvents: @escaping (Octokit.UserService.ReceivedPublicEventsPayload) -> any Publisher<[UserReceivedPublicEvent], NetworkServiceError>
    ) {
      self.user = user
      self.receivedPublicEvents = receivedPublicEvents
    }
  }
}
