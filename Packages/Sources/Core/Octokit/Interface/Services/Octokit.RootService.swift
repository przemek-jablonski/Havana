import Casimir

public extension Octokit {
  struct RootService {
    /**
     Exposes the root of the Github's REST API. Gets Hypermedia links to resources accessible in GitHub's REST API.

     - Note: Request will fail if the `privateAccessToken` will be declared incorrect / invalid / expired / revoked by the remote API.
     However, if the `privateAccessToken` won't be passed at all to this method, then the request will succeed,
     as unauthorised users have permission to use this endpoint as well.
     */
    public var apiUrls: (
      _ privateAccessToken: String?
    ) async throws -> Octokit.Hyperlinks

    /**
     Validates the `privateAccessToken` against the Github's REST API.
     */
    public var validate: (
      _ privateAccessToken: String
    ) async throws -> Void
  }
}
