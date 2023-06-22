import Foundation
import Octokit

internal struct URLSessionGithubNetworkClient: GithubNetworkClient {

  private let urlSession: URLSession
  private let jsonEncoder: JSONEncoder
  private let jsonDecoder: JSONDecoder

  internal init(
    urlSession: URLSession = .shared,
    jsonEncoder: JSONEncoder = .v4,
    jsonDecoder: JSONDecoder = .v4
  ) {
    self.urlSession = urlSession
    self.jsonEncoder = jsonEncoder
    self.jsonDecoder = jsonDecoder
  }

  internal func request<ReturnType: Decodable>(
    resource: GithubResource
  ) async throws -> ReturnType {
    try await perform(request: resource.networkRequestPayload)
  }

  private func perform<ReturnType: Decodable>(
    request: NetworkRequestPayload
  ) async throws -> ReturnType {
    try jsonDecoder.decode(
      ReturnType.self,
      from: try await urlSession.perform(
        requestTo: request.url,
        using: request.httpMethod,
        headers: request.headers ?? [:],
        queryItems: request.queryItems ?? [:],
        encoding: request.body,
        using: jsonEncoder
      )
      .get()
      .response
    )
  }
}
