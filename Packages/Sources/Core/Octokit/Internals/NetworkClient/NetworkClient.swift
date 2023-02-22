import Foundation
import Combine

internal protocol NetworkClient {
  associatedtype RequestPublisher: Publisher<Data, NetworkClientError>
  func request(
    url: String,
    method: NetworkClientHTTPMethod,
    body: Encodable?,
    headers: Headers?,
    queryItems: QueryItems?
  ) -> RequestPublisher
}

extension NetworkClient {
  typealias Headers = [String: String]
  typealias QueryItems = [String: String]
}
