import Combine
import Foundation
import Octokit

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
  func request<ReturnType: Decodable>(
    _ type: ReturnType.Type,
    using data: NetworkClientRequestData
  ) async -> Result<ReturnType, NetworkClientError> {
    await urlSessionInstance.perform(
      requestTo: data.url,
      using: data.method,
      headers: data.headers ?? [:],
      queryItems: data.queryItems ?? [:],
      encoding: data.body,
      using: jsonEncoder
    )
    
//    request(data)
//      .flatMap { [deserializer] response in
//        deserializer
//          .deserialize(response, into: type)
//          .mapError(NetworkClientError.serverResponseDeserializationFailure)
//      }
//      .eraseToAnyPublisher()
  }
}
