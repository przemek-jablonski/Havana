import Combine
import Foundation

internal struct GithubUserService {
  private let networkClient: NetworkClient
  private let deserializer: Deserializer
  
  internal init(
    networkClient: NetworkClient,
    deserializer: Deserializer
  ) {
    self.networkClient = networkClient
    self.deserializer = deserializer
  }
}

extension GithubUserService: UserService {
  public func receivedEvents(
    _ userName: String,
    _ page: Int
  ) -> AnyPublisher<[ReceivedEvent], Error> {
    return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
  }
}
