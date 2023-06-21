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

private extension GithubResource {
  var networkRequestPayload: NetworkRequestPayload {
    switch self {
      case .root(let privateAccessToken):
        return .githubRequest(
          endpoint: "/",
          httpMethod: "GET",
          token: privateAccessToken
        )
      case .allPublicEvents(
        let eventsPerPage,
        let page,
        let privateAccessToken
      ):
        return .githubRequest(
          endpoint: "/events",
          httpMethod: "GET",
          token: privateAccessToken,
          queryItems: [
            "per_page": eventsPerPage.string,
            "page": page.string
          ]
        )
      case .user(
        let privateAccessToken
      ):
        return .githubRequest(
          endpoint: "/",
          httpMethod: "GET",
          token: privateAccessToken
        )
      case .userEvents(
        let username,
        let eventsPerPage,
        let page,
        let privateAccessToken
      ):
        return .githubRequest(
          endpoint: "/users/\(username)/received_events",
          httpMethod: "GET",
          token: privateAccessToken,
          queryItems: [
            "per_page": eventsPerPage.string,
            "page": page.string
          ]
        )
    }
  }
}
