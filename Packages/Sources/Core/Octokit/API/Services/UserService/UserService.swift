import Combine

public protocol UserService {
  func userMetadata() -> AnyPublisher<User, NetworkServiceError>
  
  func receivedEvents(
    _ username: String,
    _ page: Int
  ) -> AnyPublisher<[ReceivedEvent], NetworkServiceError>
}
