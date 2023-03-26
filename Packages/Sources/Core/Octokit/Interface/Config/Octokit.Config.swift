import Casimir
import Foundation

public extension Octokit {
  typealias Config = OctokitConfig
}

/**
 Configuration object providing baseline settings that the library implementation will use.
 */
public protocol OctokitConfig {
  /**
   Base URL for the API (prefixed with network protocol) that all endpoint addresses are concatenated upon, eg. `https://api.github.com`.
   */
  var baseUrl: String { get }

  /**
   Value for the `Accept` key in the header, eg. `application/json`.
   */
  var acceptContentTypeHeaderValue: String { get }

  /**
   Value for the custom `X-GitHub-Api-Version` key in the header, giving hint to the Remote as to which version of API client is using, eg. `2022-11-28`.
   */
  var apiVersionHeaderValue: String { get }

  /**
   Convenience for constructing common request data that should be used in majority of the calls to the Remote.
   */
  func constructCommonRequestData(
    endpointUrl: String,
    method: URLRequest.HTTPMethod,
    token: String?
  ) -> Octokit.RequestCommonData
}
