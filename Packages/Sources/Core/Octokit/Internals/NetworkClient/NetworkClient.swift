import Foundation
import Combine

internal protocol NetworkClient {
  func request(
    _ data: NetworkClientRequestData
  ) -> AnyPublisher<Data, NetworkClientError>
}
