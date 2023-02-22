import Casimir
import Combine
import Foundation

internal extension NetworkClient {
  static func urlSession(using urlSessionInstance: URLSession = .shared) -> Self {
    NetworkClient(
      get: { url, body, headers, queryItems in
        URLRequest
          .from(url, body, headers, queryItems)
          .mapError { NetworkClient.Error.serverRequestConstructionFailed(error: $0) }
          .flatMap { request in
            urlSessionInstance
              .dataTaskPublisher(for: request)
              .processResponse()
          }
          .map { (data: Data, response: URLResponse) in data }
      }
    )
  }
}

private extension URLRequest {
  static func from(
    _ url: NetworkClient.EndpointAddress,
    _ body: NetworkClient.Body?,
    _ headers: NetworkClient.Headers,
    _ queryItems: NetworkClient.QueryItems
  ) -> Result<Self, Error>.Publisher {
    .success(URLRequest(url: URL(string: url)!))
  }
}

private extension URLSession.DataTaskPublisher {
  func processResponse() -> some Publisher<Output, NetworkClient.Error> {
    self
      .mapError { .internalNetworkClientFailure(error: $0 )}
      .flatMap { (data: Data, response: URLResponse) in
        guard let response = response as? HTTPURLResponse else {
          return Fail<Output, NetworkClient.Error>(error: NetworkClient.Error.serverReturnedNonHTTPContent).erased()
        }
        
        guard (200..<300) ~= response.statusCode else {
          return Fail(error: .serverReturnedBadStatusCode(code: response.statusCode)).erased()
        }
        
        return Just((data, response)).setFailureType(to: NetworkClient.Error.self).erased()
      }
  }
}
