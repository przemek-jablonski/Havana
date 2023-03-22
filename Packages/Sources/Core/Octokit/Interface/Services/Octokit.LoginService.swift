import Casimir
import Combine

public extension Octokit {
  typealias LoginService = OctokitLoginService
}

public protocol OctokitLoginService {
  func login(using privateAccessToken: String) async -> Result<Void, Octokit.PrivateAccessTokenLoginError>
}

public extension Octokit {
  enum PrivateAccessTokenLoginError: ErrorProtocol & Equatable {
    case unableToStorePrivateAccessToken(_ error: Error)

    public static var random: Octokit.PrivateAccessTokenLoginError {
      allCases.random
    }

    public static var allCases: [Octokit.PrivateAccessTokenLoginError] {
      [
        .unableToStorePrivateAccessToken(EmptyError())
      ]
    }

    public static func == (
      lhs: Octokit.PrivateAccessTokenLoginError,
      rhs: Octokit.PrivateAccessTokenLoginError
    ) -> Bool {
      switch (lhs, rhs) {
      case (.unableToStorePrivateAccessToken, .unableToStorePrivateAccessToken):
        return true
      }
    }
  }
}
