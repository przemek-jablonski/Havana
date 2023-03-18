import Foundation
import Octokit

internal extension Octokit {
  struct Config_API_2022_11_28: Octokit.Config {
    let baseUrl = "https://api.github.com"
    let acceptContentTypeHeaderValue = "application/vnd.github+json"
    let apiVersionHeaderValue = "2022-11-28"
    
    func constructCommonRequestData(
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
