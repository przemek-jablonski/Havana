import Foundation
import Octokit

extension Octokit {
  internal struct Config_API_2022_11_28: Octokit.Config {
    internal let baseUrl = "https://api.github.com"
    internal let acceptContentTypeHeaderValue = "application/vnd.github+json"
    internal let apiVersionHeaderValue = "2022-11-28"

    internal func constructCommonRequestData(
      endpointUrl: String,
      method: URLRequest.HTTPMethod,
      token: String?
    ) -> Octokit.RequestCommonData {
      Octokit.RequestCommonData(
        url: "\(baseUrl)\(endpointUrl)",
        method: method,
        headers: [
          "Accept": acceptContentTypeHeaderValue,
          "Authorization": token.map { "Bearer \($0)" },
          "X-GitHub-Api-Version": apiVersionHeaderValue
        ]
        .compactMapValues { $0 }
      )
    }
  }
}
