public extension Octokit {
  struct Config {
    public let acceptFormatHeader: String
    public let githubApiVersionHeader: String
    public let remoteBaseUrl: String
    
    public init(
      acceptFormatHeader: String,
      githubApiVersionHeader: String,
      remoteBaseUrl: String
    ) {
      self.acceptFormatHeader = acceptFormatHeader
      self.githubApiVersionHeader = githubApiVersionHeader
      self.remoteBaseUrl = remoteBaseUrl
    }
    
    internal func standardRequest( // TODO: to +live
      endpoint: String,
      method: NetworkClientHTTPMethod,
      privateAccessToken: String?
    ) -> NetworkClientRequestData {
      NetworkClientRequestData(
        url: "\(remoteBaseUrl)\(endpoint)",
        method: method,
        headers: [
          "Accept": acceptFormatHeader,
          "Authorization": privateAccessToken.map { "Bearer \($0)" },
          "X-GitHub-Api-Version": githubApiVersionHeader
        ]
          .compactMapValues { $0 }
      )
    }
  }
}

public extension Octokit.Config {
  static var `default`: Octokit.Config {
    Octokit.Config( // TODO: to +live
      acceptFormatHeader: "application/vnd.github+json",
      githubApiVersionHeader: "2022-11-28",
      remoteBaseUrl: "https://api.github.com"
    )
  }
}
