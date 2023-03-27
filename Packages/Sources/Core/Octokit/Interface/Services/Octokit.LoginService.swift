import Casimir

public extension Octokit {
  typealias LoginService = OctokitLoginService
}

public protocol OctokitLoginService {
  func login(
    using privateAccessToken: String
  ) async -> Result<Void, Octokit.PrivateAccessTokenLoginError>
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

  static var random: Octokit.PrivateAccessTokenLoginError {
    .remoteDeclaredPrivateAccessTokenInvalid(EmptyError())
  }
}
