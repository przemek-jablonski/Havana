internal extension Octokit {
    struct Config {
        let acceptFormatHeader: String
        let githubApiVersionHeader: String
        let remoteBaseUrl: String
        let token: AuthenticationService.PrivateAccessToken? // TODO: to keychain etc
    }
}
