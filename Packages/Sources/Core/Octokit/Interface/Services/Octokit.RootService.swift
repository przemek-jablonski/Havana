import Casimir

public extension Octokit {
  struct RootService {
    /**
     Exposes the root of the Github's REST API. Gets Hypermedia links to resources accessible in GitHub's REST API.

     - Note: Request will fail if the `privateAccessToken` will be declared incorrect / invalid / expired / revoked by the remote API.
     However, if the `privateAccessToken` won't be passed at all to this method, then the request will succeed,
     as unauthorised users have permission to use this endpoint as well.
     */
    public var root: (
      _ privateAccessToken: String?
    ) async throws -> Octokit.Hyperlinks

    /**
     Validates the `privateAccessToken` authenticity.
     */
    public var validateToken: (
      _ privateAccessToken: String
    ) async throws -> Void

    public init(
      root: @escaping (_ privateAccessToken: String?) async throws -> Octokit.Hyperlinks,
      validateToken: @escaping (_ privateAccessToken: String) async throws -> Void
    ) {
      self.root = root
      self.validateToken = validateToken
    }
  }
}
