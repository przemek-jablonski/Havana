import Foundation
import Combine

internal struct GithubLoginService {
  private let secretsService: SecretsService
  
  internal init(
    secretsService: SecretsService
  ) {
    self.secretsService = secretsService
  }
}

extension GithubLoginService: LoginService {
  func login(using privateAccessToken: String) -> AnyPublisher<Void, PrivateAccessTokenLoginError> {
    secretsService
      .store(.privateAccessToken, value: privateAccessToken)
      .mapError(PrivateAccessTokenLoginError.unableToStorePrivateAccessToken)
      .eraseToAnyPublisher()
  }
}
