import Combine
import Foundation
import Octokit

internal extension Octokit {
  struct LoginService_API_2022_11_28 {
    private let secretsService: SecretsService
    
    internal init(
      secretsService: SecretsService
    ) {
      self.secretsService = secretsService
    }
  }
}

extension Octokit.LoginService_API_2022_11_28: Octokit.LoginService {
  func login(
    using privateAccessToken: String
  ) async -> Result<Void, Octokit.PrivateAccessTokenLoginError> {
    await secretsService
      .store(.privateAccessToken, value: privateAccessToken)
      .mapError { .unableToStorePrivateAccessToken($0) }
  }
}
