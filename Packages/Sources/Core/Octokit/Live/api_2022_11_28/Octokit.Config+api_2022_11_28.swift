import Foundation

internal extension Octokit.Config {
  static func api_2022_11_28() -> Self {
    let baseUrl = "https://api.github.com"
    let acceptContentTypeHeaderValue = "application/vnd.github+json"
    let apiVersionHeaderValue = "2022-11-28"
    
    return Self(
      baseUrl: {
        baseUrl
      },
      acceptContentTypeHeaderValue: {
        acceptContentTypeHeaderValue
      },
      apiVersionHeaderValue: {
        apiVersionHeaderValue
      },
      commonRequestData: { endpoint, method, token in
        NetworkClientRequestData(
          url: "\(baseUrl)\(endpoint)",
          method: method,
          headers: [
            "Accept": acceptContentTypeHeaderValue,
            "Authorization": token.map { "Bearer \($0)" },
            "X-GitHub-Api-Version": apiVersionHeaderValue
          ]
            .compactMapValues { $0 }
        )
      }
    )
  }
}
