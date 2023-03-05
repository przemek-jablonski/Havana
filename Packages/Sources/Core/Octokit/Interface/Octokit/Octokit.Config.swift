public extension Octokit {
  struct Config {
    /**
     Base URL for the API (prefixed with network protocol) that all endpoint addresses are concatenated upon, eg. `https://api.github.com`.
     */
    public var baseUrl: () -> String
    
    /**
     Value for the `Accept` key in the header, eg. `application/json`.
     */
    public var acceptContentTypeHeaderValue: () -> String
    
    /**
     Value for the custom `X-GitHub-Api-Version` key in the header, giving hint to the Remote as to which version of API client is using, eg. `2022-11-28`.
     */
    public var apiVersionHeaderValue: () -> String
    
    /**
     Convenience for constructing common request data that should be used in majority of the calls to the Remote.
     */
    public var commonRequestData: (RequestPayload) -> NetworkClientRequestData
    
    public init(
      baseUrl: @escaping () -> String,
      acceptContentTypeHeaderValue: @escaping () -> String,
      apiVersionHeaderValue: @escaping () -> String,
      commonRequestData: @escaping (RequestPayload) -> NetworkClientRequestData
    ) {
      self.baseUrl = baseUrl
      self.acceptContentTypeHeaderValue = acceptContentTypeHeaderValue
      self.apiVersionHeaderValue = apiVersionHeaderValue
      self.commonRequestData = commonRequestData
    }
  }
}
