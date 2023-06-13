import Casimir

public extension Octokit {
  typealias LoginService = OctokitLoginService
}

public protocol OctokitLoginService {
  func login(
    using privateAccessToken: String
  ) async -> Result<Void, Octokit.PrivateAccessTokenLoginError>

  func isLoggedIn() async -> Result<Bool, Never>
}

public extension Octokit {
  enum PrivateAccessTokenLoginError: ErrorProtocol {
    case unableToStorePrivateAccessToken(Error)
    case remoteDeclaredPrivateAccessTokenInvalid(Error)
  }
}

public extension Octokit.PrivateAccessTokenLoginError {
  static func == (
    lhs: Octokit.PrivateAccessTokenLoginError,
    rhs: Octokit.PrivateAccessTokenLoginError
  ) -> Bool {
    switch (lhs, rhs) {
    case let (.unableToStorePrivateAccessToken(lhsError), .unableToStorePrivateAccessToken(rhsError)):
      return lhsError.localizedDescription == rhsError.localizedDescription
    case let (.remoteDeclaredPrivateAccessTokenInvalid(lhsError), .remoteDeclaredPrivateAccessTokenInvalid(rhsError)):
      return lhsError.localizedDescription == rhsError.localizedDescription
    default:
      return false
    }
  }

  static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Octokit.PrivateAccessTokenLoginError {
    [
      Octokit.PrivateAccessTokenLoginError.unableToStorePrivateAccessToken(GenericError.random()),
      Octokit.PrivateAccessTokenLoginError.remoteDeclaredPrivateAccessTokenInvalid(GenericError.random())
    ].random()
  }
}
