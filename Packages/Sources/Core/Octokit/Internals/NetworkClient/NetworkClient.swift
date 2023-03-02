import Foundation
import Combine

internal protocol NetworkClient {
  func request<ReturnType: Decodable>(
    data: NetworkClientRequestData,
    type: ReturnType.Type
  ) -> AnyPublisher<ReturnType, NetworkClientError>
}
