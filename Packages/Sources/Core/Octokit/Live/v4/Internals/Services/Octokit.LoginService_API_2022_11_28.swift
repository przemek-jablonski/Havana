import Casimir
import Combine
import Foundation
import Octokit

extension Octokit {
  internal struct LoginService_API_2022_11_28 {
    private let secretsService: SecretsService
    private let rootService: Octokit.RootService

    internal init(
      secretsService: SecretsService,
      rootService: Octokit.RootService
    ) {
      self.secretsService = secretsService
      self.rootService = rootService
    }
  }
}

extension Octokit.LoginService_API_2022_11_28: Octokit.LoginService {
  internal func login(
    using privateAccessToken: String
  ) async -> Result<Void, Octokit.PrivateAccessTokenLoginError> {
    await rootService
      .validate(privateAccessToken: privateAccessToken)
      .map { privateAccessToken }
      .mapError(Octokit.PrivateAccessTokenLoginError.remoteDeclaredPrivateAccessTokenInvalid)
      .flatMap { privateAccessToken in
        await secretsService
          .store(.privateAccessToken, value: privateAccessToken)
          .mapError(Octokit.PrivateAccessTokenLoginError.unableToStorePrivateAccessToken)
      }
  }

  internal func isLoggedIn() async -> Result<Bool, Never> {
    await secretsService
      .retrieve(.privateAccessToken)
      .map { _ in true }
      .flatMapError { _ in Result<Bool, Never>.success(false) }
  }
}
