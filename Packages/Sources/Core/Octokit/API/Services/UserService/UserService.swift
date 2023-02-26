import Combine

public protocol UserService {
  func receivedEvents(_ userName: String, _ page: Int) -> AnyPublisher<[ReceivedEvent], Error>
}
