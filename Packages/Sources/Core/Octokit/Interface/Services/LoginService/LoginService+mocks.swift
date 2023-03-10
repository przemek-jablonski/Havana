import Casimir
import Foundation
import Combine

public extension Octokit.LoginService {
  enum Mock {}
}

public extension Octokit.LoginService.Mock {
  static var loginSuccessful: Octokit.LoginService {
    Octokit.LoginService(
      login: { _ in
        Just(()).setFailureType(to: PrivateAccessTokenLoginError.self)
      }
    )
  }
  
  static var loginFailed: Octokit.LoginService {
    Octokit.LoginService(
      login: { _ in
        Fail(error: PrivateAccessTokenLoginError.unableToStorePrivateAccessToken(EmptyError()))
      }
    )
  }
}
