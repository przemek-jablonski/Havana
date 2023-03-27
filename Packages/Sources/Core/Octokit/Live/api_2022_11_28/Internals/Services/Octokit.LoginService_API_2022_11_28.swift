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
    await secretsService
      .store(.privateAccessToken, value: privateAccessToken)
      .map { privateAccessToken }
      .mapError { .unableToStorePrivateAccessToken($0) }
      .flatMap { [rootService] privateAccessToken in
        await rootService
          .validate(privateAccessToken: privateAccessToken)
          .mapError(Octokit.PrivateAccessTokenLoginError.remoteDeclaredPrivateAccessTokenInvalid)
      }
  }
}
