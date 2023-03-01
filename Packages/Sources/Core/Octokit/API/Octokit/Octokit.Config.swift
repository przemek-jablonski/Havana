public extension Octokit {
  struct Config {
    let acceptFormatHeader: String
    let githubApiVersionHeader: String
    let remoteBaseUrl: String
//    var authorizationScheme: ( String
    //    let token: AuthenticationService.PrivateAccessToken? // TODO: to keychain etc
  }
}

public extension Octokit.Config {
  static var `default`: Octokit.Config {
    Octokit.Config(
      acceptFormatHeader: "application/vnd.github+json",
      githubApiVersionHeader: "2022-11-28",
      remoteBaseUrl: "https://api.github.com"
    )
  }
}
