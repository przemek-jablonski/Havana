import Foundation

public extension Octokit {
  /**
   Configuration object providing baseline settings that the `Octokit` will use.
   */
  struct Config {
    /**
     Base URL for the API (prefixed with network protocol) that all endpoint addresses are concatenated upon, eg. `https://api.github.com`.
     */
    var baseUrl: () -> String

    /**
     Value for the `Accept` key in the header, eg. `application/json`.
     */
    var acceptContentTypeHeaderValue: () -> String

    /**
     Value for the custom `X-GitHub-Api-Version` key in the header, giving hint to the Remote as to which version of API client is using, eg. `2022-11-28`.
     */
    var apiVersionHeaderValue: () -> String
  }
}
