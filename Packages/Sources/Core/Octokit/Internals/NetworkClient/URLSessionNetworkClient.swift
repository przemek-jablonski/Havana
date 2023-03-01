import Combine
import Foundation

internal struct URLSessionNetworkClient {
  private let urlSessionInstance: URLSession
  
  internal init(urlSessionInstance: URLSession = .shared) {
    self.urlSessionInstance = urlSessionInstance
  }
}

extension URLSessionNetworkClient: NetworkClient {
  func request(
    _ data: NetworkClientRequestData
  ) -> AnyPublisher<Data, NetworkClientError> {
    URLRequest
      .from(data.url, data.body, data.headers ?? [:], data.queryItems ?? [:])
      .mapError { NetworkClientError.serverRequestConstructionFailed(error: $0) }
      .flatMap { [urlSessionInstance] request in
        urlSessionInstance
          .dataTaskPublisher(for: request)
          .processResponse()
      }
      .map { (data: Data, response: URLResponse) in data }
      .eraseToAnyPublisher()
  }
  
//  func request(
//    url: String,
//    method: NetworkClientHTTPMethod, // TODO: use this
//    body: Encodable?,
//    headers: Headers?,
//    queryItems: QueryItems?
//  ) -> AnyPublisher<Data, NetworkClientError> {
//  }
}

private extension URLRequest {
  static func from(
    _ url: String,
    _ body: Encodable?,
    _ headers: [String: String],
    _ queryItems: [String: String]
  ) -> Result<Self, Error>.Publisher {
    Result.success(URLRequest(url: URL(string: url)!)).publisher // TODO: !
  }
}

private extension URLSession.DataTaskPublisher {
  func processResponse() -> some Publisher<Output, NetworkClientError> {
    self
      .mapError { .internalNetworkClientFailure(error: $0 )}
      .flatMap { (data: Data, response: URLResponse) in
        guard let response = response as? HTTPURLResponse else {
          return Fail<Output, NetworkClientError>(error: NetworkClientError.serverReturnedNonHTTPContent).eraseToAnyPublisher()
        }
        
        guard (200..<300) ~= response.statusCode else {
          return Fail(error: .serverReturnedInvalidStatusCode(code: response.statusCode)).eraseToAnyPublisher()
        }
        
        return Just((data, response)).setFailureType(to: NetworkClientError.self).eraseToAnyPublisher()
      }
  }
}
