import Foundation
import Combine

public extension Octokit.LoginService {
  internal static func live(secretsService: SecretsService) -> Self {
    Self(
      login: { token in
        secretsService
          .store(.privateAccessToken, value: token)
          .mapError(PrivateAccessTokenLoginError.unableToStorePrivateAccessToken)
      }
    )
  }
}
