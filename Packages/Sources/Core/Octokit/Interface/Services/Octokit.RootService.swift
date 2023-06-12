import Casimir

public extension Octokit {
  typealias RootService = OctokitRootService
}

public protocol OctokitRootService {
  /**
   Exposes the root of the Github's REST API. Get Hypermedia links to resources accessible in GitHub's REST API.

   - Note: Request will fail if the `privateAccessToken` will be declared incorrect / invalid / expired / revoked by the remote API.
   However, if the `privateAccessToken` won't be passed at all to this method, then the request will (most likely) succeed,
   as unauthorised users have permission to use this endpoint as well.
   */
  func get(
    privateAccessToken: String?
  ) async -> Result<Octokit.Hyperlinks, Octokit.NetworkServiceError>

  /**
   Validates the `privateAccessToken` against the Github's REST API.

   - Note: It uses the `get(privateAccessToken)` call internally to test token validation.
   */
  func validate(
    privateAccessToken: String
  ) async -> Result<Void, Octokit.PrivateAccessTokenValidationError>
}

public extension Octokit {
  enum PrivateAccessTokenValidationError: ErrorProtocol {
    case remoteDeclaredPrivateAccessTokenInvalid(Error)
  }
}

extension Octokit.PrivateAccessTokenValidationError {
  public static func == (
    lhs: Octokit.PrivateAccessTokenValidationError,
    rhs: Octokit.PrivateAccessTokenValidationError
  ) -> Bool {
    switch (lhs, rhs) {
    case let (
      .remoteDeclaredPrivateAccessTokenInvalid(lhsError),
      .remoteDeclaredPrivateAccessTokenInvalid(rhsError)
    ):
      return lhsError.localizedDescription == rhsError.localizedDescription
    }
  }

  public static func random(_ randomNumberGenerator: inout RandomNumberGenerator) -> Self {
    .remoteDeclaredPrivateAccessTokenInvalid(GenericError.random())
  }
}
