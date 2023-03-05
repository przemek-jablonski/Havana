public extension Octokit {
  struct Config {
    
    var baseUrl: () -> String
    
    var acceptContentTypeHeaderValue: () -> String
    
    var apiVersionHeaderValue: () -> String
    
    typealias Endpoint = String
    typealias Token = String
    var commonRequestData: (
      _ endpoint: Endpoint,
      _ method: NetworkClientHTTPMethod,
      _ token: Token?
    ) -> NetworkClientRequestData
  }
}
