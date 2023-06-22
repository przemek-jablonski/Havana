import Casimir
import Combine
import Foundation
import Octokit

internal extension Octokit.LoginService {
  static func v4(
    secretsService: SecretsService,
    rootService: Octokit.RootService,
    networkClient: GithubNetworkClient
  ) -> Self {
    Self(
      login: { token in
        try await rootService.validateToken(token)
        try await secretsService.store(.privateAccessToken, token)
      },
      isLoggedIn: {
        do {
          _ = try await rootService.validateToken(
            try secretsService.retrieve(.privateAccessToken)
          )
          return true
        } catch {
          return false
        }
      }
    )
  }
}
