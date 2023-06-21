import Foundation

private let baseUrl = "https://api.github.com"
private let acceptContentTypeHeaderValue = "application/vnd.github+json"
private let apiVersionHeaderValue = "2022-11-28"

internal extension NetworkRequestPayload {
  /**
   Convenience function for constructing `NetworkRequestPayload` with Github's `v4` API data (baseUrl, headers) prefilled for convenience.
   */
  static func githubRequest(
    endpoint: String,
    httpMethod: String,
    token: String?,
    queryItems: [String: String]? = [:]
  ) -> Self {
    self.init(
      url: "\(baseUrl)\(endpoint)",
      httpMethod: httpMethod,
      headers: [
        "Accept": acceptContentTypeHeaderValue,
        "Authorization": token.map { "Bearer \($0)" },
        "X-GitHub-Api-Version": apiVersionHeaderValue
      ]
        .compactMapValues { $0 },
      queryItems: queryItems
    )
  }
}
