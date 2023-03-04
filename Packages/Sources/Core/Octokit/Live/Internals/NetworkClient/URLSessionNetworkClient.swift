import Combine
import Foundation

internal struct URLSessionNetworkClient {
  private let urlSessionInstance: URLSession
  private let jsonEncoder: JSONEncoder
  private let deserializer: Deserializer
  
  internal init(
    urlSessionInstance: URLSession = .shared,
    jsonEncoder: JSONEncoder = JSONEncoder(),
    deserializer: Deserializer
  ) {
    self.urlSessionInstance = urlSessionInstance
    self.jsonEncoder = jsonEncoder
    self.deserializer = deserializer
  }
}

extension URLSessionNetworkClient: NetworkClient {
  func request<ReturnType>(
    _ type: ReturnType.Type,
    using data: NetworkClientRequestData
  ) -> AnyPublisher<ReturnType, NetworkClientError> where ReturnType: Decodable {
    request(data)
      .flatMap { [deserializer] response in
        deserializer
          .deserialize(response, into: type)
          .mapError(NetworkClientError.serverResponseDeserializationFailure)
      }
      .eraseToAnyPublisher()
  }
  
  private func request(
    _ data: NetworkClientRequestData
  ) -> some Publisher<Data, NetworkClientError> {
    // TODO: move some of this to Casimir
    URLRequest
      .from(
        data.url,
        data.method.rawValue,
        data.body,
        data.headers ?? [:],
        data.queryItems ?? [:],
        using: jsonEncoder
      )
      .mapError(NetworkClientError.serverRequestConstructionFailed)
      .flatMap { [urlSessionInstance] request in
        urlSessionInstance
          .dataTaskPublisher(for: request)
          .processResponse()
      }
      .map { (data: Data, response: URLResponse) in data }
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
      .mapError(NetworkClientError.internalNetworkClientFailure)
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
