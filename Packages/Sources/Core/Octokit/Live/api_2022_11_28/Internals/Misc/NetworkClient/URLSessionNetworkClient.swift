import Casimir
import Foundation
import Octokit

internal struct URLSessionNetworkClient {
  private let urlSessionInstance: URLSession
  private let jsonEncoder: JSONEncoder
  private let jsonDecoder: JSONDecoder

  internal init(
    urlSessionInstance: URLSession = .shared,
    jsonEncoder: JSONEncoder = .forAPI_2022_11_28,
    jsonDecoder: JSONDecoder = .forAPI_2022_11_28
  ) {
    self.urlSessionInstance = urlSessionInstance
    self.jsonEncoder = jsonEncoder
    self.jsonDecoder = jsonDecoder
  }
}

extension URLSessionNetworkClient: NetworkClient {
  func request(
    using data: Octokit.RequestCommonData
  ) async -> Result<Data, NetworkClientError> {
    await urlSessionInstance.perform(
      requestTo: data.url,
      using: data.method,
      headers: data.headers ?? [:],
      queryItems: data.queryItems ?? [:],
      encoding: data.body,
      using: jsonEncoder
    )
    .mapError(NetworkClientError.networkRequestFailure)
    .map { response in response.response }
  }

  internal func request<ReturnType: Decodable>(
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
    .flatMap { [jsonDecoder] response -> Result<ReturnType, NetworkClientError> in
      jsonDecoder
        .decode(type, from: response.response)
        .logIfDecodingFails(of: response.response)
        .mapError(NetworkClientError.responseDecodingFailure)
    }
  }
}
