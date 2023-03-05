import Foundation
import Combine

internal extension Octokit.LoginService {
  static func live(secretsService: SecretsService) -> Octokit.LoginService {
    Self(
      login: { [secretsService] token in
        secretsService
          .store(.privateAccessToken, value: token)
          .mapError(PrivateAccessTokenLoginError.unableToStorePrivateAccessToken)
      }
    )
  }
}
