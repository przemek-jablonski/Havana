import Foundation
import Combine

internal struct GithubLoginService {
  private let networkClient: NetworkClient
  private let deserializer: Deserializer
  private let secretsService: SecretsService
  
  internal init(
    networkClient: NetworkClient,
    deserializer: Deserializer,
    secretsService: SecretsService
  ) {
    self.networkClient = networkClient
    self.deserializer = deserializer
    self.secretsService = secretsService
  }
}

extension GithubLoginService: LoginService {
  func login(using privateAccessToken: String) -> AnyPublisher<Void, PrivateAccessTokenLoginError> {
    secretsService
      .store(.privateAccessToken, value: privateAccessToken)
      .mapError(PrivateAccessTokenLoginError.unableToStorePrivateAccessToken(error: ))
      .eraseToAnyPublisher()
  }
}
