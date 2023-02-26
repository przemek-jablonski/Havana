import Foundation
import Combine

internal protocol NetworkClient {
  func request(
    url: String,
    method: NetworkClientHTTPMethod,
    body: Encodable?,
    headers: Headers?,
    queryItems: QueryItems?
  ) -> AnyPublisher<Data, NetworkClientError>
}

extension NetworkClient {
  typealias Headers = [String: String]
  typealias QueryItems = [String: String]
}
