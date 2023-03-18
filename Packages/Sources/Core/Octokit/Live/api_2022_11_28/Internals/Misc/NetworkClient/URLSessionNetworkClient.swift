import Casimir
import Combine
import Foundation
import Octokit

internal struct URLSessionNetworkClient {
  private let urlSessionInstance: URLSession
  private let jsonEncoder: JSONEncoder
  private let jsonDecoder: JSONDecoder
  
  internal init(
    urlSessionInstance: URLSession = .shared
  ) {
    self.urlSessionInstance = urlSessionInstance
    self.jsonEncoder = JSONEncoder()
    self.jsonDecoder = JSONDecoder(dateDecodingStrategy: .iso8601)
  }
}

extension URLSessionNetworkClient: NetworkClient {
  func request<ReturnType: Decodable>(
    _ type: ReturnType.Type,
    using data: Octokit.RequestCommonData
  ) async -> Result<ReturnType, NetworkClientError> {
    await urlSessionInstance.perform(
      requestTo: data.url,
      using: data.method,
      headers: data.headers ?? [:],
      queryItems: data.queryItems ?? [:],
      encoding: data.body,
      using: jsonEncoder
    )
    .mapError(NetworkClientError.networkRequestFailure)
    .flatMap { [jsonDecoder] response in
      jsonDecoder
        .decode(type, from: response.response)
        .mapError(NetworkClientError.responseDecodingFailure)
    }
  }
}
