import Combine
import Foundation
import Octokit

//internal extension Octokit.LoginService {
//  static func live(secretsService: SecretsService) -> Octokit.LoginService {
//    Octokit.LoginService(
//      login: { [secretsService] token in
//        secretsService
//          .store(.privateAccessToken, value: token)
//          .mapError(Octokit.PrivateAccessTokenLoginError.unableToStorePrivateAccessToken)
//      }
//    )
//  }
//}

internal extension Octokit {
  struct LoginService_API_2022_11_28 {
    internal init(secretsService: SecretsService) {
      self.secretsService = secretsService
    }
    
    private let secretsService: SecretsService
  }
}

extension Octokit.LoginService_API_2022_11_28: Octokit.LoginService {
  func login(using privateAccessToken: String) async -> Result<Void, Octokit.PrivateAccessTokenLoginError> {
    await secretsService
      .store(.privateAccessToken, value: privateAccessToken)
      .mapError { .unableToStorePrivateAccessToken($0) }
  }
}
