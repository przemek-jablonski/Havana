import Foundation
import Combine

internal protocol NetworkClient {
  func request<ReturnType: Decodable>(
    _ type: ReturnType.Type,
    using data: NetworkClientRequestData
  ) -> AnyPublisher<ReturnType, NetworkClientError>
}
