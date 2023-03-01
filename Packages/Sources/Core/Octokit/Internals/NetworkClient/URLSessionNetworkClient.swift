import Combine
import Foundation

internal struct URLSessionNetworkClient {
  private let urlSessionInstance: URLSession
  private let jsonEncoder: JSONEncoder
  
  internal init(
    urlSessionInstance: URLSession = .shared,
    jsonEncoder: JSONEncoder = JSONEncoder()
  ) {
    self.urlSessionInstance = urlSessionInstance
    self.jsonEncoder = jsonEncoder
  }
}

extension URLSessionNetworkClient: NetworkClient {
  func request(
    _ data: NetworkClientRequestData
  ) -> AnyPublisher<Data, NetworkClientError> {
    URLRequest
      .from(
        data.url,
        data.method.rawValue,
        data.body,
        data.headers ?? [:],
        data.queryItems ?? [:],
        using: jsonEncoder
      )
      .mapError { NetworkClientError.serverRequestConstructionFailed(error: $0) }
      .flatMap { [urlSessionInstance] request in
        urlSessionInstance
          .dataTaskPublisher(for: request)
          .processResponse()
      }
      .map { (data: Data, response: URLResponse) in data }
      .eraseToAnyPublisher()
  }
}

private extension URLRequest {
  enum URLRequestConstructionError: Error {
    case constructingURLComponentsWithQueryItemsFailure(url: String, queryItems: [String: String])
    case extracingURLFromURLComponentsFailure(url: String, queryItems: [String: String])
    case encodingRequestBodyFailure
  }
  
  static func from(
    _ url: String,
    _ httpMethod: String,
    _ body: Encodable?,
    _ headers: [String: String],
    _ queryItems: [String: String],
    using jsonEncoder: JSONEncoder
  ) -> Result<Self, URLRequestConstructionError>.Publisher {
    
    guard let urlComponents = URLComponents(
      url: url,
      queryItems: queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
    ) else {
      return .failure(.constructingURLComponentsWithQueryItemsFailure(url: url, queryItems: queryItems))
    }
    
    guard let url = urlComponents.url else {
      return .failure(.extracingURLFromURLComponentsFailure(url: url, queryItems: queryItems))
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = httpMethod
    
    headers.forEach {
      request.addValue($0.value, forHTTPHeaderField: $0.key)
    }
    
    
    do {
      request.httpBody = try body?.data(using: jsonEncoder)
    } catch {
      return .failure(.encodingRequestBodyFailure)
    }
    
    return .success(request)
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

private extension URLComponents {
  init?(
    url: String,
    queryItems: [URLQueryItem]? = nil
  ) {
    self.init(string: url)
    self.queryItems = queryItems
  }
}

private extension Encodable {
  func data(using jsonEncoder: JSONEncoder = JSONEncoder()) throws -> Data {
    try jsonEncoder.encode(self)
  }
}
